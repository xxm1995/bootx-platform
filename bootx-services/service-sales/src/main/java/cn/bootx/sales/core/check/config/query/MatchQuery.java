package cn.bootx.sales.core.check.config.query;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
* @author xxm
* @date 2021/5/12
*/
@Data
@Accessors(chain = true)
@Schema(title = "匹配配置查询参数")
@NoArgsConstructor
@AllArgsConstructor
public class MatchQuery {

    @Schema(description= "匹配类型")
    private Integer matchType;

    @Schema(description= "id集合")
    private List<Long> ids;

}
