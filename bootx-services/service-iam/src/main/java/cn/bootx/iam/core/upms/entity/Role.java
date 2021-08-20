package cn.bootx.iam.core.upms.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.upms.convert.RoleConvert;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.param.upms.RoleParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 角色
* @author xxm
* @date 2020/5/1 17:31
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_role")
@Accessors(chain = true)
public class Role extends MpBaseEntity implements EntityBaseFunction<RoleDto> {

    /** 编码 */
    private String code;

    /** 名称 */
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

    public static Role init(RoleDto roleDto){
        return RoleConvert.CONVERT.convert(roleDto);
    }
    public static Role init(RoleParam in){
        return RoleConvert.CONVERT.convert(in);
    }

    @Override
    public RoleDto toDto() {
        return RoleConvert.CONVERT.convert(this);
    }
}
