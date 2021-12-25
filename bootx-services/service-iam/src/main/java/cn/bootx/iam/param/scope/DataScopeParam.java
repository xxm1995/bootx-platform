package cn.bootx.iam.param.scope;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/12/24
*/
@Data
@Accessors(chain = true)
@Schema(title = "数据范围权限")
public class DataScopeParam{

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "编码")
    private String code;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "类型")
    private Integer type;

    @Schema(description = "备注")
    private String remark;}
