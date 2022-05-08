package cn.bootx.demo.core.mq.redis;

import cn.bootx.common.redis.listener.RedisTopicListener;
import org.springframework.stereotype.Component;

/**   
* 测试消息队列
* @author xxm  
* @date 2022/5/7 
*/
@Component
public class T1TopicListener implements RedisTopicListener<String> {
    @Override
    public String getTopic() {
        return "testt1";
    }

    @Override
    public void onMessage(String obj) {
        System.out.println(obj);
    }
}
