package cn.bootx.starter.query.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author xxm
 * @date 2021/11/17
 */
@Data
@Accessors(chain = true)
@ApiModel("查询项")
public class QueryParam {

    @ApiModelProperty("拼接条件是否为或")
    private boolean or;

    @ApiModelProperty("参数名称")
    private String paramName;

    /**
     * @see cn.bootx.starter.query.code.CompareTypeEnum
     */
    @ApiModelProperty("比较类型")
    private String compareType;

    /**
     * @see cn.bootx.starter.query.code.ParamTypeEnum
     */
    @ApiModelProperty("参数类型")
    private String paramType;

    @ApiModelProperty("参数值")
    private Object paramValue;

    @ApiModelProperty("参数名称是否需要转换成下划线命名")
    private boolean underLine = true;

    @ApiModelProperty("嵌套查询")
    private List<QueryParam> nestedParams;
}
