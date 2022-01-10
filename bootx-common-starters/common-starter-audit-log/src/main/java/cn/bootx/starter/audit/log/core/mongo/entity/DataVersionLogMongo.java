package cn.bootx.starter.audit.log.core.mongo.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.starter.audit.log.core.mongo.convert.LogConvert;
import cn.bootx.starter.audit.log.dto.DataVersionLogDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

/**
* 数据版本日志
* @author xxm
* @date 2022/1/10
*/
@EqualsAndHashCode(callSuper = true)
@Data
@FieldNameConstants
@Accessors(chain = true)
@Document("starter_data_version")
public class DataVersionLogMongo extends MpIdEntity implements EntityBaseFunction<DataVersionLogDto> {

    @Schema(description = "数据名称")
    private String dataName;

    @Schema(description = "数据主键")
    private String dataId;

    @Schema(description = "数据内容")
    private String dataContent;

    @Schema(description = "数据版本")
    private Integer version;

    @Schema(description = "创建者ID")
    private Long creator;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

    @Override
    public DataVersionLogDto toDto() {
        return LogConvert.CONVERT.convert(this);
    }
}
