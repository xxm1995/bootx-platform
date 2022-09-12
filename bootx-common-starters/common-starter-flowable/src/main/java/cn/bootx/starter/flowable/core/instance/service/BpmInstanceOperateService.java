package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.exception.InstanceNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotPublishException;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.bootx.starter.flowable.param.instance.InstanceStartParam;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.EndEvent;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.Process;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.ModelCode.PUBLISHED;

/**
 * 流程实例
 * @author xxm
 * @date 2022/8/23 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmInstanceOperateService {
    private final BpmModelManager bpmModelManager;

    private final RuntimeService runtimeService;
    private final RepositoryService repositoryService;

    /**
     * 启动一个流程
     */
    @Transactional(rollbackFor = Exception.class)
    public void start(InstanceStartParam instanceParam){
        BpmModel bpmModel = bpmModelManager.findById(instanceParam.getModelId()).orElseThrow(ModelNotExistException::new);
        // 未发布
        if (!Objects.equals(bpmModel.getPublish(), PUBLISHED)){
            throw new ModelNotPublishException();
        }
        Optional<UserDetail> currentUser = SecurityUtil.getCurrentUser();
        String userName = currentUser.map(UserDetail::getName).orElse("未知");

        String title = instanceParam.getName();
        if (StrUtil.isBlank(title)){
            title = bpmModel.getName() + "[" + userName +"]";
        }
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setFormVariables(instanceParam.getFormVariables())
                .setStartUser(currentUser);
        BpmContextLocal.put(bpmContext);

        runtimeService.createProcessInstanceBuilder()
                .processDefinitionId(bpmModel.getDefId())
                .name(title)
                .start();
    }


    /**
     * 挂起实例
     */
    public void suspend(String instanceId){
        // 激活状态
        runtimeService.suspendProcessInstanceById(instanceId);
    }

    /**
     * 激活流程
     */
    public void activate(String instanceId){
        // 非激活状态
        runtimeService.activateProcessInstanceById(instanceId);
    }

    /**
     * 关闭流程
     */
    public void close(String instanceId) {
        ProcessInstance processInstance = Optional.ofNullable(runtimeService.createProcessInstanceQuery()
                .processInstanceId(instanceId)
                .singleResult())
                .orElseThrow(InstanceNotExistException::new);
            //1、获取终止节点
            List<EndEvent> endNodes = getEndNode(processInstance.getProcessDefinitionId());
            String endId = endNodes.get(0).getId();
            //2、执行终止
            List<Execution> executions = runtimeService.createExecutionQuery().parentId(instanceId).list();
            List<String> executionIds = executions.stream()
                    .map(Execution::getId)
                    .collect(Collectors.toList());
            runtimeService.createChangeActivityStateBuilder().moveExecutionsToSingleActivityId(executionIds, endId)
                    .changeState();
    }

    /**
     * 获取结束节点
     */
    private List<EndEvent> getEndNode(String processDefId) {
        Process mainProcess = Optional.ofNullable(repositoryService.getBpmnModel(processDefId).getMainProcess())
                .orElseThrow(ModelNotExistException::new);
        Collection<FlowElement> list = mainProcess.getFlowElements();
        if (CollUtil.isEmpty(list)) {
            return new ArrayList<>(0);
        }
        return list.stream()
                .filter(f -> f instanceof EndEvent)
                .map(flowElement -> (EndEvent) flowElement)
                .collect(Collectors.toList());
    }

}
