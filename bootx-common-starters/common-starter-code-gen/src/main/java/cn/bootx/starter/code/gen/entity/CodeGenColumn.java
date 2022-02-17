package cn.bootx.starter.code.gen.entity;

import lombok.Data;
import lombok.experimental.Accessors;

/**
* 代码生成行信息
* @author xxm
* @date 2022/2/17
*/
@Data
@Accessors(chain = true)
public class CodeGenColumn {

    /** 名称 */
    private String name;
    /** 类型 */
    private String attrType;
    /** 备注 */
    private String comments;

}
