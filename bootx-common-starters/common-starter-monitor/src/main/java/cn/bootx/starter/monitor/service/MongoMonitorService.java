package cn.bootx.starter.monitor.service;

import cn.bootx.starter.monitor.entity.MongoMonitorResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

/**
 * MongoDb信息监控
 *
 * @author xxm
 * @date 2022/6/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class MongoMonitorService {

    private final MongoTemplate mongoTemplate;

    /**
     * MongoDB信息监控
     */
    public MongoMonitorResult getMongoInfo() {
        MongoMonitorResult result = new MongoMonitorResult();
        return result;
    }

}
