package cn.bootx.goods.task;

import lombok.RequiredArgsConstructor;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.springframework.stereotype.Component;

/**
* 库存定时任务
* @author xxm
* @date 2021/4/16
*/
@Component
@RequiredArgsConstructor
public class InventoryTask implements Job {
    private final InventoryTaskService inventoryTaskService;

    @Override
    public void execute(JobExecutionContext context) {
        inventoryTaskService.expireTokens();
    }
}
