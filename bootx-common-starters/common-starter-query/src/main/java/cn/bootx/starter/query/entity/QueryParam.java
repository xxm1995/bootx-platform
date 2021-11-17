package cn.bootx.starter.query.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* @author xxm
* @date 2021/11/17 
*/
@Data
@Accessors(chain = true)
@ApiModel("查询项")
public class QueryParam {

    @ApiModelProperty("参数名称")
    private String paramName;

    /**
     * @see cn.bootx.starter.query.code.CompareTypeEnum
     */
    @ApiModelProperty("比较类型")
    private String compareType;

    /**
     * @see
     */
    @ApiModelProperty("参数类型")
    private String paramType;

    @ApiModelProperty("参数值")
    private Object paramValue;

}
