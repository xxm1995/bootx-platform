package cn.bootx.starter.query.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
*
* @author xxm  
* @date 2021/11/17 
*/
@Data
@Accessors(chain = true)
@Schema(title = "查询排序")
public class QueryOrder {

    @Schema(name = "设置排序字段")
    private String sortField;

    @Schema(name = "是否升序")
    private boolean asc = true;
}
