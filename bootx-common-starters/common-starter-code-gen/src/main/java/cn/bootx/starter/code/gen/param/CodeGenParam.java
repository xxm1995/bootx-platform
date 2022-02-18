package cn.bootx.starter.code.gen.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 代码生成参数
* @author xxm
* @date 2022/2/18
*/
@Data
@Accessors(chain = true)
@Schema(title = "代码生成参数")
public class CodeGenParam {

    @Schema(description = "表名")
    private String tableName;

    @Schema(description = "模块")
    private String module;

    @Schema(description = "功能")
    private String method;

    @Schema(description = "创建人")
    private String author;

}
