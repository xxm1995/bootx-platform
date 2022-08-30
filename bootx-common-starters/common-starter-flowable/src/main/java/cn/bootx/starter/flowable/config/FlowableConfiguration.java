package cn.bootx.starter.flowable.config;

import cn.bootx.starter.flowable.handler.behavior.BpmActivityBehaviorFactory;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.IdUtil;
import org.flowable.common.engine.api.delegate.event.FlowableEventListener;
import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Flowable 配置类
 * @author xxm
 * @date 2022/8/24
 */
@Configuration
public class FlowableConfiguration {
    /**
     * 1. 设置各种监听器
     * 2. 设置自定义的 ActivityBehaviorFactory 实现
     * 3. 其他的一些配置
     */
    @Bean
    public EngineConfigurationConfigurer<SpringProcessEngineConfiguration> bpmProcessEngineConfigurationConfigurer(
            ObjectProvider<FlowableEventListener> listeners,
            BpmActivityBehaviorFactory bpmActivityBehaviorFactory) {
        return configuration -> {
            // 注册监听器
            configuration.setEventListeners(ListUtil.toList(listeners.iterator()));
            // 设置 ActivityBehaviorFactory 实现类，用于流程任务的审核人的自定义
            configuration.setActivityBehaviorFactory(bpmActivityBehaviorFactory);
            // 注册id生成器, 使用雪花id
            configuration.setIdGenerator(IdUtil::getSnowflakeNextIdStr);
            // 部署时不生成流程图图片
            configuration.setCreateDiagramOnDeploy(false);
        };
    }

}
