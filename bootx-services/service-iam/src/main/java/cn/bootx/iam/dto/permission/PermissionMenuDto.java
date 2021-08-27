package cn.bootx.iam.dto.permission;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/7/12
*/
@Data
@Accessors(chain = true)
@ApiModel("菜单权限")
public class PermissionMenuDto implements Serializable {
    private static final long serialVersionUID = 1935403328634321841L;

    /** 主键 */
    private Long id;

    /** 父id */
    private Long parentId;

    /** 菜单标题 */
    private String title;

    /** 路由名称，建议唯一 */
    private String name;

    /** 菜单权限编码 */
    private String perms;

    /** 图标 */
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

    /**
     * 描述
     */
    private String description;

    /** 系统菜单 */
    private boolean admin;

    /**
     * 子节点
     */
    private List<PermissionMenuDto> children;
}
