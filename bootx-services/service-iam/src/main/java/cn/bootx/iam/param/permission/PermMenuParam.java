package cn.bootx.iam.param.permission;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/7/12
*/
@Data
@Accessors(chain = true)
@Schema(title = "菜单权限")
public class PermMenuParam implements Serializable {
    private static final long serialVersionUID = 3017200753543614579L;

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "父id")
    private Long parentId;

    @Schema(description = "菜单标题")
    private String title;

    @Schema(description = "路由名称，建议唯一")
    private String name;

    @Schema(description = "菜单权限编码")
    private String perms;

    @Schema(description = "菜单图标")
    private String icon;

    @Schema(description = "是否隐藏")
    private boolean hidden;

    @Schema(description = "是否隐藏子菜单")
    private boolean hideChildrenInMenu;

    @Schema(description = "组件")
    private String component;

    @Schema(description = "路径")
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

    @Schema(description = "meta")
    /**
     * 是否缓存页面
     */
    private boolean keepAlive;

    @Schema(description = "打开方式是否为外部打开")
    private boolean targetOutside;

    @Schema(description = "隐藏的标题内容")
    private boolean hiddenHeaderContent;

    @Schema(description = "系统菜单")
    private boolean admin;

    /**
     * 描述
     */
    private String description;

}