package cn.bootx.office.core.instance.service;

import cn.bootx.office.core.instance.dao.BpmInstanceManager;
import cn.bootx.office.core.instance.entity.BpmInstance;
import cn.bootx.office.core.model.dao.BpmModelManager;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.office.param.instance.FlowInstanceParam;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotPublishException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Objects;

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

    /**
     * 启动一个流程
     */
    @Transactional(rollbackFor = Exception.class)
    public void start(Long modelId, FlowInstanceParam instanceParam){

        BpmModel bpmModel = bpmModelManager.findById(modelId).orElseThrow(ModelNotExistException::new);
        // 未发布
        if (Objects.equals(bpmModel.getPublish(), PUBLISH_FALSE)){
            throw new ModelNotPublishException();
        }

        ProcessInstance instance = runtimeService.createProcessInstanceBuilder()
                .processDefinitionId(bpmModel.getDefId())
                .name(instanceParam.getName())
                .businessKey(instanceParam.getBusinessKey())
                .start();

        BpmInstance bpmInstance = new BpmInstance()
                .setInstanceId(instance.getProcessInstanceId())
                .setFlowModelId(modelId)
                .setModelType(bpmModel.getModelType())
                .setDefId(bpmModel.getDefId())
                .setDefName(bpmModel.getDefName())
                .setStartUserId(Long.valueOf(instance.getStartUserId()))
                .setStartTime(LocalDateTime.now());

        bpmInstanceManager.save(bpmInstance);
    }

    /**
     * 分页
     */

}
