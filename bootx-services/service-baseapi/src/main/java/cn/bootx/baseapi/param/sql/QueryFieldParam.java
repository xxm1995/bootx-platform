package cn.bootx.baseapi.param.sql;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author xxm
 * @date 2023/3/9
 */
@Data
@Accessors(chain = true)
@Schema(title = "通过SQL查询结果字段请求参数")
public class QueryFieldParam {

    @Schema(description = "数据源Id")
    private Long databaseId;

    @Schema(description = "SQL语句")
    private String sql;

}
