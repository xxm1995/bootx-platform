package cn.bootx.demo.core.mq.redis;

import cn.bootx.common.redis.listener.RedisTopicListener;
import org.springframework.stereotype.Component;

/**   
* 测试Redis消息队列
* @author xxm  
* @date 2022/5/7 
*/
@Component
public class DemoRedisTopicListener implements RedisTopicListener<String> {

    @Override
    public String getTopic() {
        return "testt1";
    }

    @Override
    public void onMessage(String obj) {
        System.out.println(obj);
    }
}
