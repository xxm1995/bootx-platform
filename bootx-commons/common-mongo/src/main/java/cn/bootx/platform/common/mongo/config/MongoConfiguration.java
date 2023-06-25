package cn.bootx.platform.common.mongo.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.MongoTransactionManager;

/**
 * mongo相关配置
 *
 * @author xxm
 * @since 2022/1/21
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class MongoConfiguration {

    /**
     * mongoDB事务管理器(无副本集的情况下不可以使用事务)
     */
    // @Bean
    public MongoTransactionManager transactionManager(MongoDatabaseFactory factory) {
        return new MongoTransactionManager(factory);
    }

}
