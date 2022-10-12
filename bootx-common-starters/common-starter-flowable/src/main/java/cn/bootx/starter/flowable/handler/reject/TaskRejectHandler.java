package cn.bootx.starter.flowable.handler.reject;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.starter.flowable.util.FlowableUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BaseElement;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.api.FlowableException;
import org.flowable.common.engine.api.FlowableObjectNotFoundException;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskInfo;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 方法不支持多对多跳转
 * 回退不能够直接回退到子流程上，我这里按照只能回退到用户任务节点处理的
 * 驳回可以直接驳回到子流程开始
 * @author linjinp
 * @date 2020/4/3 10:37
 */
@Slf4j
@Service
@AllArgsConstructor
public class TaskRejectHandler {

    private final TaskService taskService;
    private final RuntimeService runtimeService;
    private final RepositoryService repositoryService;
    private final HistoryService historyService;

    /**
     * 驳回, 返回驳回到的任务节点id
     */
    public void rejectTalk(Task task) {
        if (task.isSuspended()) {
            throw new BizException("任务处于挂起状态");
        }
        // 获取全部节点列表，包含子节点
        Process process = repositoryService.getBpmnModel(task.getProcessDefinitionId()).getMainProcess();
        Collection<FlowElement> flowNodes = FlowableUtil.getAllElements(process.getFlowElements(), null);
        // 获取当前任务节点元素
        FlowElement currentNode = flowNodes.stream()
                .filter(flowElement -> Objects.equals(flowElement.getId(),task.getTaskDefinitionKey()))
                .findAny()
                .orElse(null);

        // 上级任务列表 目的获取所有跳转到的节点 targetIds
        List<UserTask> lastUserTaskList = FlowableUtil.findParentUserTasks(currentNode, null, null);
        if (CollUtil.isEmpty(lastUserTaskList)) {
            throw new BizException("当前节点为初始任务节点，不能驳回");
        }
        // 上级任务节点列表 节点 Key
        List<String> lastUserTaskNodeIds = lastUserTaskList.stream()
                .map(BaseElement::getId)
                .collect(Collectors.toList());

        // 获取全部历史节点活动实例，即已经走过的节点历史，数据采用开始时间升序
        List<HistoricTaskInstance> historicTaskInstanceList = historyService
                .createHistoricTaskInstanceQuery()
                .processInstanceId(task.getProcessInstanceId())
                .orderByHistoricTaskInstanceStartTime()
                .asc()
                .list();

        // 数据清洗，将回滚导致的脏数据清洗掉
        List<String> lastHistoricTaskNodeIds = FlowableUtil.historicTaskInstanceClean(flowNodes, historicTaskInstanceList);
        // 此时历史任务实例为倒序，获取最后走的节点
        List<String> rejectIds = new ArrayList<>();
        // 循环结束标识，遇到当前目标节点的次数
        int number = 0;
        String lastHistoricTaskNodeId = null;
        for (String historicTaskNodeId : lastHistoricTaskNodeIds) {
            // 当会签时候会出现特殊的，连续都是同一个节点历史数据的情况，这种时候跳过
            if (Objects.equals(lastHistoricTaskNodeId,historicTaskNodeId)) {
                continue;
            }
            lastHistoricTaskNodeId = historicTaskNodeId;
            if (Objects.equals(historicTaskNodeId,task.getTaskDefinitionKey())) {
                number ++;
            }
            // 在数据清洗后，历史节点就是唯一一条从起始到当前节点的历史记录，理论上每个点只会出现一次
            // 在流程中如果出现循环，那么每次循环中间的点也只会出现一次，再出现就是下次循环
            // number == 1，第一次遇到当前节点
            // number == 2，第二次遇到，代表最后一次的循环范围
            if (number == 2) {
                break;
            }
            // 如果当前历史节点，属于父级的节点，说明最后一次经过了这个点，需要退回这个点
            if (lastUserTaskNodeIds.contains(historicTaskNodeId)) {
                rejectIds.add(historicTaskNodeId);
            }
        }

        // 目的获取所有需要被跳转的节点 currentIds
        // 取其中一个父级任务，因为后续要么存在公共网关，要么就是串行公共线路
        UserTask oneUserTask = lastUserTaskList.get(0);
        // 获取所有正常进行的任务节点 Key，这些任务不能直接使用，需要找出其中需要撤回的任务
        List<Task> runTaskList = taskService.createTaskQuery()
                .processInstanceId(task.getProcessInstanceId())
                .list();
        List<String> runTaskKeyList = runTaskList.stream().map(TaskInfo::getTaskDefinitionKey).collect(Collectors.toList());

        // 通过父级网关的出口连线，结合 runTaskList 比对，获取需要撤回的任务
        List<UserTask> currentUserTaskList = FlowableUtil.findChildUserTasks(oneUserTask, runTaskKeyList, null, null);
        // 需驳回任务列表
        List<String> currentIds = currentUserTaskList.stream().map(BaseElement::getId).collect(Collectors.toList());
        // 规定：并行网关之前节点必须需存在唯一用户任务节点，如果出现多个任务节点，则并行网关节点默认为结束节点，原因为不考虑多对多情况
        if (rejectIds.size() > 1 && currentIds.size() > 1) {
            throw new BizException("任务出现多对多情况，无法撤回");
        }

        try {
            // 如果父级任务多于 1 个，说明当前节点不是并行节点，原因为不考虑多对多情况
            if (rejectIds.size() > 1) {
                // 1 对 多任务跳转，currentIds 当前节点(1)，targetIds 跳转到的节点(多)
                runtimeService.createChangeActivityStateBuilder()
                        .processInstanceId(task.getProcessInstanceId())
                        .moveSingleActivityIdToActivityIds(currentIds.get(0), rejectIds)
                        .changeState();
            }
            // 如果父级任务只有一个，因此当前任务可能为网关中的任务
            if (rejectIds.size() == 1) {
                // 1 对 1 或 多 对 1 情况，currentIds 当前要跳转的节点列表(1或多)，targetIds.get(0) 跳转到的节点(1)
                runtimeService.createChangeActivityStateBuilder()
                        .processInstanceId(task.getProcessInstanceId())
                        .moveActivityIdsToSingleActivityId(currentIds, rejectIds.get(0))
                        .changeState();
            }
        } catch (FlowableObjectNotFoundException e) {
            log.error(e.getMessage(),e);
            throw new BizException("未找到流程实例，流程可能已发生变化");
        } catch (FlowableException e) {
            log.error(e.getMessage(),e);
            throw new BizException("无法取消或开始活动");
        }
    }

    /**
     * 流程回退
     * @param task 当前任务
     * @param targetKey 要回退的任务 Key
     */
    public void flowReturn(Task task, String targetKey) {
        if (task.isSuspended()) {
            throw new BizException("任务处于挂起状态");
        }
        // 获取流程定义信息
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .processDefinitionId(task.getProcessDefinitionId()).singleResult();
        // 获取所有节点信息
        Process process = repositoryService.getBpmnModel(processDefinition.getId())
                .getProcesses()
                .get(0);
        // 获取全部节点列表，包含子节点
        Collection<FlowElement> allElements = FlowableUtil.getAllElements(process.getFlowElements(), null);
        // 获取当前任务节点元素
        FlowElement source = null;
        // 获取跳转的节点元素
        FlowElement target = null;
        if (allElements != null) {
            for (FlowElement flowElement : allElements) {
                // 当前任务节点元素
                if (flowElement.getId().equals(task.getTaskDefinitionKey())) {
                    source = flowElement;
                }
                // 跳转的节点元素
                if (flowElement.getId().equals(targetKey)) {
                    target = flowElement;
                }
            }
        }

        // 从当前节点向前扫描
        // 如果存在路线上不存在目标节点，说明目标节点是在网关上或非同一路线上，不可跳转
        // 否则目标节点相对于当前节点，属于串行
        Boolean isSequential = FlowableUtil.iteratorCheckSequentialReferTarget(source, targetKey, null, null);
        if (!isSequential) {
            throw new BizException("当前节点相对于目标节点，不属于串行关系，无法回退");
        }

        // 获取所有正常进行的任务节点 Key，这些任务不能直接使用，需要找出其中需要撤回的任务
        List<Task> runTaskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
        List<String> runTaskKeyList = new ArrayList<>();
        runTaskList.forEach(item -> runTaskKeyList.add(item.getTaskDefinitionKey()));
        // 需退回任务列表
        List<String> currentIds = new ArrayList<>();
        // 通过父级网关的出口连线，结合 runTaskList 比对，获取需要撤回的任务
        List<UserTask> currentUserTaskList = FlowableUtil.findChildUserTasks(target, runTaskKeyList, null, null);
        currentUserTaskList.forEach(item -> currentIds.add(item.getId()));

        try {
            // 1 对 1 或 多 对 1 情况，currentIds 当前要跳转的节点列表(1或多)，targetKey 跳转到的节点(1)
            runtimeService.createChangeActivityStateBuilder().processInstanceId(task.getProcessInstanceId()).moveActivityIdsToSingleActivityId(currentIds, targetKey).changeState();
        } catch (FlowableObjectNotFoundException e) {
            log.error(e.getMessage(),e);
            throw new BizException("未找到流程实例，流程可能已发生变化");
        } catch (FlowableException e) {
            log.error(e.getMessage(),e);
            throw new BizException("无法取消或开始活动");
        }
    }

    /**
     * 获取所有可回退的节点
     */
    public List<UserTask> findReturnUserTask(String taskId) {
        // 当前任务 task
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        // 获取流程定义信息
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(task.getProcessDefinitionId()).singleResult();
        // 获取所有节点信息，暂不考虑子流程情况
        Process process = repositoryService.getBpmnModel(processDefinition.getId()).getProcesses().get(0);
        Collection<FlowElement> flowElements = process.getFlowElements();
        // 获取当前任务节点元素
        UserTask source = null;
        if (flowElements != null) {
            for (FlowElement flowElement : flowElements) {
                // 类型为用户节点
                if (flowElement.getId().equals(task.getTaskDefinitionKey())) {
                    source = (UserTask) flowElement;
                }
            }
        }
        // 获取节点的所有路线
        List<List<UserTask>> roads = FlowableUtil.findRoad(source, null, null, null);
        // 可回退的节点列表
        List<UserTask> userTaskList = new ArrayList<>();
        for (List<UserTask> road : roads) {
            if (userTaskList.size() == 0) {
                // 还没有可回退节点直接添加
                userTaskList = road;
            } else {
                // 如果已有回退节点，则比对取交集部分
                userTaskList.retainAll(road);
            }
        }
        return userTaskList;
    }

}
