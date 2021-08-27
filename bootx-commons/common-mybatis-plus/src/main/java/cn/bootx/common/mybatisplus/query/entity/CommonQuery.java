package cn.bootx.common.mybatisplus.query.entity;


import lombok.Data;
import lombok.EqualsAndHashCode;

/**
* 公共查询
* @author 7326
* @date 2021/8/25
*/
@EqualsAndHashCode(callSuper = true)
@Data
public class CommonQuery extends OrderQuery {

    /** 查询类型 */
    private String queryType;

    /** 查询项目 */
    private String queryItems;

}
