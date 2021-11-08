package cn.bootx.starter.quartz.task;

import lombok.extern.slf4j.Slf4j;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

/**   
* 测试定时任务
* @author xxm  
* @date 2021/11/8 
*/
@Slf4j
public class TestTask implements Job {
    @Override
    public void execute(JobExecutionContext context) {
        log.info("定时任务测试");
    }
}
