package cn.bootx.iam.core.permission.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.permission.convert.PermissionConvert;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.param.permission.PermissionMenuParam;
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
@TableName("iam_permission_menu")
public class PermissionMenu extends MpBaseEntity implements EntityBaseFunction<PermissionMenuDto> {

    /** 父id */
    private Long parentId;

    /** 菜单标题 */
    private String title;

    /** 路由名称，建议唯一 */
    private String name;

    /** 菜单权限编码 */
    private String perms;

    /** 菜单图标 */
    private String icon;

    /** 是否隐藏 */
    private boolean hidden;

    /** 是否隐藏子菜单 */
    private boolean hideChildrenInMenu;

    /** 组件 */
    private String component;

    /** 路径 */
    private String path;

    /**
     * 菜单跳转地址(重定向)
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

    /* meta */
    /**
     * 是否缓存页面
     */
    private boolean keepAlive;

    /** 打开方式是否为外部打开 */
    private boolean targetOutside;

    /** 隐藏的标题内容 */
    private boolean hiddenHeaderContent;

    /** 系统菜单 */
    private boolean admin;

    /**
     * 描述
     */
    private String description;

    public static PermissionMenu init(PermissionMenuParam in){
        return PermissionConvert.CONVERT.convert(in);
    }

    @Override
    public PermissionMenuDto toDto() {
        return PermissionConvert.CONVERT.convert(this);
    }
}
