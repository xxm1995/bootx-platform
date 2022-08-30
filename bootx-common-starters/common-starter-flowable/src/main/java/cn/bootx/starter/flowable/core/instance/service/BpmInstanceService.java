package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.dto.instance.BpmInstanceDto;
import cn.bootx.starter.flowable.dto.instance.InstanceInfo;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotPublishException;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.bootx.starter.flowable.param.instance.InstanceStartParam;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.runtime.ProcessInstanceQuery;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
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
public class BpmInstanceService {
    private final BpmModelManager bpmModelManager;
    private final BpmInstanceManager bpmInstanceManager;

    private final RuntimeService runtimeService;

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
     * 我的发起分页
     */
    public PageResult<InstanceInfo> pageMyApply(PageParam pageParam){
        ProcessInstanceQuery instanceQuery = runtimeService.createProcessInstanceQuery()
                .startedBy(String.valueOf(SecurityUtil.getUserId()))
                .orderByStartTime().desc();
        List<ProcessInstance> processInstances = instanceQuery.listPage(pageParam.start(), pageParam.getSize());
        long total = instanceQuery.count();

        List<String> instanceId = processInstances.stream().map(Execution::getProcessInstanceId).collect(Collectors.toList());
        List<InstanceInfo> instanceInfos = this.convertInstanceInfo(instanceId);
        return new PageResult<InstanceInfo>().setCurrent(pageParam.getCurrent())
                .setRecords(instanceInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }

    /**
     * 获取流程实例详情
     */
    public BpmInstanceDto findByInstanceId(String instanceId){
        return bpmInstanceManager.findByInstanceId(instanceId).map(BpmInstance::toDto)
                .orElseThrow(() -> new DataNotExistException("流程实例不存在"));
    }

    /**
     * 获取当前节点
     */
    public List<String> getCurrentNode(String instanceId){

        return runtimeService.createExecutionQuery().processInstanceId(instanceId)
                .list()
                .stream()
                .map(Execution::getActivityId)
                .distinct()
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    /**
     * 转换 processInstances 为 系统中的对象
     */
    public List<InstanceInfo> convertInstanceInfo(List<String> instanceIds){
        Map<String, BpmInstance> bpmInstanceMap = bpmInstanceManager.findAllByInstanceIds(instanceIds).stream().collect(Collectors.toMap(BpmInstance::getInstanceId, o -> o));
        return instanceIds.stream().map(instanceId -> {
            BpmInstance bpmInstance = Optional.ofNullable(bpmInstanceMap.get(instanceId)).orElse(new BpmInstance());
            return new InstanceInfo()
                    .setName(bpmInstance.getInstanceName())
                    .setInstanceId(bpmInstance.getInstanceId())
                    .setState(bpmInstance.getState())
                    .setStartTime(bpmInstance.getStartTime())
                    .setEndTime(bpmInstance.getEndTime())
                    .setStartUserId(bpmInstance.getStartUserId())
                    .setStartUserName(bpmInstance.getStartUserName())
                    .setDefMame(bpmInstance.getDefName());
        }).collect(Collectors.toList());
    }

}
