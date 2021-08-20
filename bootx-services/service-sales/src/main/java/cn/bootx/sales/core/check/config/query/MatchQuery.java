package cn.bootx.sales.core.check.config.query;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("匹配配置查询参数")
@NoArgsConstructor
@AllArgsConstructor
public class MatchQuery {

    @ApiModelProperty("匹配类型")
    private Integer matchType;

    @ApiModelProperty("id集合")
    private List<Long> ids;

}
