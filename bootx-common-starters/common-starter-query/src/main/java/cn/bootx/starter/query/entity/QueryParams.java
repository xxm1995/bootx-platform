package cn.bootx.starter.query.entity;

import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "查询参数")
public class QueryParams {

    @Schema(name = "参数集合")
    private List<QueryParam> queryParams;

    @Schema(name = "排序集合")
    private List<QueryOrder> queryOrders;

}
