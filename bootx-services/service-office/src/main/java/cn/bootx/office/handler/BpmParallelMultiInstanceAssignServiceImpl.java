package cn.bootx.office.handler;

import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.exception.ModelNodeNotExistException;
import cn.bootx.starter.flowable.handler.behavior.BpmParallelMultiInstanceAssignService;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.MultiInstanceActivityBehavior;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static cn.bootx.starter.flowable.code.ModelNodeCode.*;

/**   
 * 会签串签等任务处理人员分配
 * @author xxm  
 * @date 2022/9/4 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmParallelMultiInstanceAssignServiceImpl implements BpmParallelMultiInstanceAssignService {
    private final BpmModelNodeManager bpmModelNodeManager;

    @Override
    public List<Long> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior multiInstanceActivityBehavior) {
        List<Long> userIds = new ArrayList<>(0);
        BpmContext bpmContext = BpmContextLocal.get();
        // TODO 处理驳回情况的人员分配

        // 获取节点配置并设置处理人
        BpmModelNode modelTask = bpmModelNodeManager.findByDefIdAndTaskId(execution.getProcessDefinitionId(), execution.getCurrentActivityId())
                .orElseThrow(ModelNodeNotExistException::new);

        // 发起人
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_SPONSOR)){

        }
        // 用户手动选择
        if (Objects.equals(modelTask.getAssignType(), ASSIGN_SELECT)){
            userIds = bpmContext.getNextAssignUserIds();
        }

        // 指定用户组
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_USER)){
            //noinspection unchecked
            userIds = (List<Long>) modelTask.getAssignRaw();
        }

        // 指定角色
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_ROLE)){
            List<Long> roleIds = (List<Long>) modelTask.getAssignRaw();
        }

        return userIds;
    }
}
