package cn.bootx.starter.quartz.core.service;

import cn.bootx.starter.quartz.core.dao.QuartzJobLogManager;
import cn.bootx.starter.quartz.core.entity.QuartzJobLog;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**   
* 定时任务日志
* @author xxm  
* @date 2022/5/1 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class QuartzJobLogService {
    private final QuartzJobLogManager quartzJobLogManager;

    @Async("asyncExecutor")
    public void add(QuartzJobLog quartzJobLog){
        log.info("{}",quartzJobLog);
    }
}
