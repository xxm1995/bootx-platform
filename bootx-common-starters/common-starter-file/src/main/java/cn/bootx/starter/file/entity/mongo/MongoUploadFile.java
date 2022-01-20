package cn.bootx.starter.file.entity.mongo;

import lombok.Data;
import lombok.experimental.Accessors;
import org.bson.types.Binary;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
* 文件上传(mongo存储)
* @author xxm
* @date 2022/1/20
*/
@Data
@Accessors(chain = true)
@Document("file_upload")
public class MongoUploadFile {
    @Id
    private Long id;

    /** 文件内容 */
    private Binary content;
}
