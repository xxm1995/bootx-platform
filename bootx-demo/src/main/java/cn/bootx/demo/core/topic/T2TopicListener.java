package cn.bootx.demo.core.topic;

import cn.bootx.common.core.rest.dto.KeyValue;
import cn.bootx.common.redis.listener.RedisTopicListener;
import org.springframework.stereotype.Component;

/**   
* 测试消息队列
* @author xxm  
* @date 2022/5/7 
*/
@Component
public class T2TopicListener implements RedisTopicListener<KeyValue> {
    @Override
    public String getTopic() {
        return "t2";
    }

    @Override
    public void onMessage(KeyValue obj) {
        System.out.println(obj);
    }
}
