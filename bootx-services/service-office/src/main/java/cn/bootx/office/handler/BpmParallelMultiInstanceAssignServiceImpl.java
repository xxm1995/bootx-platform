package cn.bootx.office.handler;

import cn.bootx.starter.flowable.handler.behavior.BpmParallelMultiInstanceAssignService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.MultiInstanceActivityBehavior;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**   
 * 会签串签等任务处理人员分配
 * @author xxm  
 * @date 2022/9/4 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmParallelMultiInstanceAssignServiceImpl implements BpmParallelMultiInstanceAssignService {

    @Override
    public List<Long> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior multiInstanceActivityBehavior) {
        return Arrays.asList(1399985191002447872L);
    }
}
