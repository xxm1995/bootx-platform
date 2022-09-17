package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.dto.instance.InstanceInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.flowable.engine.HistoryService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**   
 * 流程实例管理
 * @author xxm  
 * @date 2022/9/17 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmInstanceAdminService {
    private final HistoryService historyService;
    private final BpmInstanceQueryService queryService;

    /**
     * 我的发起分页
     */
    public PageResult<InstanceInfo> page(PageParam pageParam){
        val instanceQuery = historyService.createHistoricProcessInstanceQuery()
                .orderByProcessInstanceStartTime().desc();
        val historicProcessInstances = instanceQuery.listPage(pageParam.start(), pageParam.getSize());
        long total = instanceQuery.count();

        List<String> instanceId = historicProcessInstances.stream().map(HistoricProcessInstance::getId).collect(Collectors.toList());
        List<InstanceInfo> instanceInfos = queryService.convertInstanceInfo(instanceId);
        return new PageResult<InstanceInfo>().setCurrent(pageParam.getCurrent())
                .setRecords(instanceInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }
}
