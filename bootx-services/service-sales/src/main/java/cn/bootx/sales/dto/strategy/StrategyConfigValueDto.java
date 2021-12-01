package cn.bootx.sales.dto.strategy;

import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "策略脚本配置项值")
public class StrategyConfigValueDto implements Serializable {

    private static final long serialVersionUID = -7481890055777714856L;

    @Schema(description= "主键")
    private Long id;

    @Schema(description= "策略配置主键", required = true)
    private Long strategyConfigId;

    @Schema(description= "值", required = true)
    private String value;

    @Schema(description= "创建时间")
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
