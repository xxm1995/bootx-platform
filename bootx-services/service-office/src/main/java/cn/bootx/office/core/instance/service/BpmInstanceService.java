package cn.bootx.office.core.instance.service;

import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.office.core.instance.dao.BpmInstanceManager;
import cn.bootx.office.core.instance.entity.BpmInstance;
import cn.bootx.office.core.model.dao.BpmModelManager;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.office.param.instance.FlowInstanceParam;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotPublishException;
import cn.hutool.core.util.DesensitizedUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.IdentityService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.Optional;

import static cn.bootx.office.code.ModelCode.PUBLISH_FALSE;

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
    private final IdentityService identityService;

    /**
     * 启动一个流程
     */
    @Transactional(rollbackFor = Exception.class)
    public void start(FlowInstanceParam instanceParam){
        BpmModel bpmModel = bpmModelManager.findById(instanceParam.getModelId()).orElseThrow(ModelNotExistException::new);
        // 未发布
        if (Objects.equals(bpmModel.getPublish(), PUBLISH_FALSE)){
            throw new ModelNotPublishException();
        }

        ProcessInstance instance = runtimeService.createProcessInstanceBuilder()
                .processDefinitionId(bpmModel.getDefId())
                .name(instanceParam.getName())
                .businessKey(instanceParam.getBusinessKey())
                .start();
        Long startUserId = Optional.ofNullable(instance.getStartUserId()).map(Long::valueOf).orElse(DesensitizedUtil.userId());

        BpmInstance bpmInstance = new BpmInstance()
                .setInstanceId(instance.getProcessInstanceId())
                .setBpmModelId(instanceParam.getModelId())
                .setModelType(bpmModel.getModelType())
                .setDefId(bpmModel.getDefId())
                .setDefName(bpmModel.getDefName())
                .setStartUserId(startUserId)
                .setStartTime(LocalDateTimeUtil.of(instance.getStartTime()))
                .setFormVariables(instanceParam.getFormVariables());

        bpmInstanceManager.save(bpmInstance);
    }

    /**
     * 分页
     */

}
