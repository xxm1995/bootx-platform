package cn.bootx.starter.file.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.core.convert.MongoConverter;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;

/**
 * 文件上传配置
 *
 * @author xxm
 * @date 2022/2/15
 */
@Configuration
@RequiredArgsConstructor
public class FileUploadConfiguration {

    private final FileUploadProperties properties;

    /**
     * 自定义 GridFsTemplate
     */
    @Bean
    public GridFsTemplate gridFsTemplate(MongoDatabaseFactory dbFactory, MongoConverter converter) {
        return new GridFsTemplate(dbFactory, converter, properties.getMongo().getBucket());
    }

}
