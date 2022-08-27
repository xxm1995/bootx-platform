package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.dto.instance.InstanceInfo;
import cn.bootx.starter.flowable.param.instance.InstanceStartParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotPublishException;
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
        Long userId = currentUser.map(UserDetail::getId).orElse(null);
        String userName = currentUser.map(UserDetail::getName).orElse("未知");

        String title = instanceParam.getName();
        if (StrUtil.isBlank(title)){
            title = bpmModel.getName() + "[" + userName +"]";
        }

        ProcessInstance instance = runtimeService.createProcessInstanceBuilder()
                .processDefinitionId(bpmModel.getDefId())
                .name(title)
                .businessKey(instanceParam.getBusinessKey())
                .start();
        BpmInstance bpmInstance = new BpmInstance()
                .setInstanceId(instance.getProcessInstanceId())
                .setStartUserId(userId)
                .setStartUserName(userName)
                .setStartTime(LocalDateTimeUtil.of(instance.getStartTime()))
                .setFormVariables(instanceParam.getFormVariables());

        bpmInstanceManager.save(bpmInstance);
    }

    /**
     * 我的发起分页
     */
    public PageResult<InstanceInfo> pageMyApply(PageParam pageParam){
        ProcessInstanceQuery instanceQuery = runtimeService.createProcessInstanceQuery()
                .startedBy(String.valueOf(SecurityUtil.getUserId()))
                .orderByStartTime().desc();
        long total = instanceQuery.count();
        List<ProcessInstance> processInstances = instanceQuery.listPage(pageParam.start(), pageParam.getSize());
        List<InstanceInfo> instanceInfos = this.convertInstanceInfo(processInstances);
        return new PageResult<InstanceInfo>().setCurrent(pageParam.getCurrent())
                .setRecords(instanceInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }


    /**
     * 转换 processInstances 为 系统中的对象
     */
    public List<InstanceInfo> convertInstanceInfo(List<ProcessInstance> processInstances){
        List<String> ids = processInstances.stream().map(Execution::getProcessInstanceId).collect(Collectors.toList());

        Map<String, BpmInstance> bpmInstanceMap = bpmInstanceManager.findAllByInstanceIds(ids).stream().collect(Collectors.toMap(BpmInstance::getInstanceId, o -> o));
        return processInstances.stream().map(o -> {
            BpmInstance bpmInstance = Optional.ofNullable(bpmInstanceMap.get(o.getProcessInstanceId())).orElse(new BpmInstance());
            return new InstanceInfo()
                    .setName(o.getName())
                    .setInstanceId(o.getProcessInstanceId())
                    .setStartTime(bpmInstance.getStartTime())
                    .setEndTime(bpmInstance.getEndTime())
                    .setStartUserId(bpmInstance.getStartUserId())
                    .setStartUserName(bpmInstance.getStartUserName())
                    .setDefMame(o.getProcessDefinitionName());
        }).collect(Collectors.toList());
    }

}
