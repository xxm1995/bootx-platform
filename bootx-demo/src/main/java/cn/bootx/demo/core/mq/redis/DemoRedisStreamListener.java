package cn.bootx.demo.core.mq.redis;

import org.springframework.data.redis.connection.stream.ObjectRecord;
import org.springframework.data.redis.connection.stream.RecordId;
import org.springframework.data.redis.stream.StreamListener;

/**
 * RedisStream 消息队列 (未实现)
 *
 * @author xxm
 * @date 2022/6/4
 */
public class DemoRedisStreamListener implements StreamListener<String, ObjectRecord<String, String>> {

    @Override
    public void onMessage(ObjectRecord<String, String> message) {
        RecordId recordId = message.getId();
        recordId.getValue();
    }

}
