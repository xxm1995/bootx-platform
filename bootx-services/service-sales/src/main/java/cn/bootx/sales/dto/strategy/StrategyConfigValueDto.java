package cn.bootx.sales.dto.strategy;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2020/10/11
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "策略脚本配置项值")
public class StrategyConfigValueDto implements Serializable {

    private static final long serialVersionUID = -7481890055777714856L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "策略配置主键", required = true)
    private Long strategyConfigId;

    @ApiModelProperty(value = "值", required = true)
    private String value;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    //只用于展示
    /**
     * 配置项名称
     */
    private String configName;
    /**
     * 配置项字段类型
     */
    private String configType;

}
