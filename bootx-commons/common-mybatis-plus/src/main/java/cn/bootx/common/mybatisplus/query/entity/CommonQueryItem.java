package cn.bootx.common.mybatisplus.query.entity;

import lombok.Data;

/**
* 公共查询项
* @author it7326
* @date 2021/8/25
*/
@Data
public class CommonQueryItem {
    /** 属性名 */
    private String field;

    /** 规则 */
    private String rule;

    /**  */
    private String val;

}
