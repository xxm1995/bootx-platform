package cn.bootx.starter.query.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author xxm
 * @date 2021/11/17
 */
@Data
@Accessors(chain = true)
@Schema(title = "查询项")
public class QueryParam {

    @Schema(name = "拼接条件是否为或")
    private boolean or;

    @Schema(name = "参数名称")
    private String paramName;

    /**
     * @see cn.bootx.starter.query.code.CompareTypeEnum
     */
    @Schema(name = "比较类型")
    private String compareType;

    /**
     * @see cn.bootx.starter.query.code.ParamTypeEnum
     */
    @Schema(name = "参数类型")
    private String paramType;

    @Schema(name = "参数值")
    private Object paramValue;

    @Schema(name = "参数名称是否需要转换成下划线命名")
    private boolean underLine = true;

    @Schema(name = "嵌套查询")
    private List<QueryParam> nestedParams;
}
