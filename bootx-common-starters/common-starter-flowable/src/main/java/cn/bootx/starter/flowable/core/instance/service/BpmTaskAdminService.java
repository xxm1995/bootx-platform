package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RuntimeService;
import org.springframework.stereotype.Service;

/**   
 * 流程任务管理员服务
 * @author xxm  
 * @date 2022/9/11 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskAdminService {
    private final BpmInstanceManager bpmInstanceManager;

    private final RuntimeService runtimeService;
    private final HistoryService historyService;

    /**
     * 待处理任务
     */


    /**
     * 已处理任务
     */


    /**
     * 取消任务
     */


}
