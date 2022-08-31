package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.exception.ModelNotPublishException;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.bootx.starter.flowable.param.instance.InstanceStartParam;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.RuntimeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.Optional;

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

}
