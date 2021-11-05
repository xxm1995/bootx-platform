package cn.bootx.starter.quartz.task;

import lombok.extern.slf4j.Slf4j;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

@Slf4j
public class TestTask implements Job {
    @Override
    public void execute(JobExecutionContext context) {
        log.info("定时任务测试");
    }
}
