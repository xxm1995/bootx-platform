package cn.bootx.starter.audit.log.configuration;

import cn.bootx.common.mybatisplus.interceptor.MpInterceptor;
import cn.bootx.starter.audit.log.handler.DataVersionRecordHandler;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author xxm
 * @date 2023/1/2
 */
@Configuration
public class DataVersionConfiguration {
    /**
     * 数据变更记录
     */
    @Bean
    public MpInterceptor dataChangeRecorderInnerInterceptor(DataVersionRecordHandler dataVersionRecordHandler){
        return new MpInterceptor(dataVersionRecordHandler,2);
    }
}
