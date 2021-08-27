package cn.bootx.iam.dto.upms;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("角色")
public class RoleDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 5532196699667233754L;

    /** 角色code */
    private String code;

    /** 角色名称 */
    private String name;

    /** 是否系统内置 Y 内置 N 不是  内置 不能修改*/
    private boolean system;

    /**
     * 数据权限类型
     */
    private String dsType;

    /**
     * 数据权限范围
     */
    private String dsScope;

    /** 描述 */
    private String description;

}
