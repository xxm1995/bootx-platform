package cn.bootx.starter.query.entity;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
*
* @author xxm  
* @date 2021/11/17 
*/
@Data
@Accessors(chain = true)
@ApiModel("查询排序")
public class QueryOrder {

    /**设置排序*/
    private String sortParam;
    /**默认排序规则*/
    private boolean asc = true;
}
