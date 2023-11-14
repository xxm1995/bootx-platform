package cn.bootx.platform.starter.file.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Configuration;

/**
 * 文件上传配置
 *
 * @author xxm
 * @since 2022/2/15
 */
@Configuration
@ConditionalOnClass(name="org.springframework.data.mongodb.gridfs.GridFsTemplate")
@RequiredArgsConstructor
public class FileUploadConfiguration {

    private final FileUploadProperties properties;

    /**
     * 自定义 GridFsTemplate
     */
//    @Bean
//    public GridFsTemplate gridFsTemplate(MongoDatabaseFactory dbFactory, MongoConverter converter) {
//        return new GridFsTemplate(dbFactory, converter, properties.getMongo().getBucket());
//    }

}
