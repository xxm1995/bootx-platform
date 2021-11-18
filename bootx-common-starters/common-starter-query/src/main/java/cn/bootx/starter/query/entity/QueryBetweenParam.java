package cn.bootx.starter.query.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* Between 类型参数
* @author xxm  
* @date 2021/11/18 
*/
@Data
@Accessors(chain = true)
@ApiModel("Between 类型参数")
public class QueryBetweenParam {

    @ApiModelProperty("开始参数")
    private Object start;

    @ApiModelProperty("结束参数")
    private Object end;
}
