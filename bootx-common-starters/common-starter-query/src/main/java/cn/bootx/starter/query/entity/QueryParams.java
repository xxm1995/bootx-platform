package cn.bootx.starter.query.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
* 查询参数
* @author xxm  
* @date 2021/11/17 
*/
@Data
@Accessors(chain = true)
@ApiModel("查询参数")
public class QueryParams {

    @ApiModelProperty("参数集合")
    private List<QueryParam> queryParams;

    @ApiModelProperty("排序集合")
    private List<QueryOrder> queryOrders;

}
