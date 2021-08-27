package cn.bootx.iam.param.permission;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/6/16
*/
@Data
@Accessors(chain = true)
@ApiModel("权限信息参数")
public class PermissionPathParam implements Serializable {
    private static final long serialVersionUID = 7617748080025164673L;

    /** 主键 */
    private Long id;

    /** 权限的标识 */
    private String code;

    /** 权限名称 */
    private String name;

    /** 启用 */
    private boolean enable;

    /** 权限描述 */
    private String description;

}
