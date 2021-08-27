
package cn.bootx.common.mybatisplus.query.entity;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * @author 7326
 */
@Data
@ApiModel("通用排序类")
public class OrderQuery {
    /**设置排序*/
    private String sortField;
    /**默认排序规则*/
    private String sortOrder = "ascend";
}