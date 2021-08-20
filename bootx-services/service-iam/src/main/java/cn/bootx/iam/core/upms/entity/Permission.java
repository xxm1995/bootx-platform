package cn.bootx.iam.core.upms.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.upms.convert.PermissionConvert;
import cn.bootx.iam.dto.upms.PermissionDto;
import cn.bootx.iam.param.upms.PermissionParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 权限配置
* @author xxm  
* @date 2021/8/3 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_permission")
public class Permission extends MpBaseEntity implements EntityBaseFunction<PermissionDto> {

    /** 父id */
    private Long parentId;

    /** 菜单名称 */
    private String name;

    /** 菜单权限编码 */
    private String perms;

    /** 菜单图标 */
    private String icon;

    /** 是否隐藏 */
    private boolean hidden;

    /** 组件 */
    private String component;

    /** 组件名字 */
    private String componentName;

    /** 路径 */
    private String url;

    /**
     * 一级菜单跳转地址
     */
    private String redirect;

    /**
     * 菜单排序
     */
    private Double sortNo;

    /**
     * 类型（0：一级菜单；1：子菜单 ；2：按钮权限）
     */
    private Integer menuType;

    /**
     * 是否叶子节点: 1:是  0:不是
     */
    private boolean leaf;

    /**
     * 是否缓存页面
     */
    private boolean keepAlive;

    /** 外链菜单打开方式 0/内部打开 1/外部打开 */
    private boolean internalOrExternal;

    /**
     * 描述
     */
    private String description;

    public static Permission init(PermissionParam in){
        return PermissionConvert.CONVERT.convert(in);
    }

    @Override
    public PermissionDto toDto() {
        return PermissionConvert.CONVERT.convert(this);
    }
}
