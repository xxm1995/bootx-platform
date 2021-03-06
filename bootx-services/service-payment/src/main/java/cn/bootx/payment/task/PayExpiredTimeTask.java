package cn.bootx.payment.task;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.*;
import org.springframework.stereotype.Component;

/**
* 超时支付单任务撤销(2-5秒轮训一次)
* @author xxm
* @date 2022/7/12
*/
@Slf4j
@Component
@DisallowConcurrentExecution
@PersistJobDataAfterExecution
@RequiredArgsConstructor
public class PayExpiredTimeTask implements Job {
    private final PayExpiredTimeTaskService payExpiredTimeTaskService;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        payExpiredTimeTaskService. sync();
    }
}
