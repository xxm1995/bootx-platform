package cn.bootx.iam.dto.upms;

import cn.bootx.iam.code.permission.PermissionCode;
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
public class PermissionDto implements Serializable {
    private static final long serialVersionUID = 1935403328634321841L;

    /** 主键 */
    private Long id;

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
     * @see PermissionCode
     */
    private Integer menuType;


    /**
     * 是否叶子节点: 1:是  0:不是
     */
    private boolean leaf;

    /**
     * 是否缓存页面: 0:不是  1:是（默认值1）
     */
    private boolean keepAlive;

    /** 外链菜单打开方式 0/内部打开 1/外部打开 */
    private boolean internalOrExternal;

    /**
     * 描述
     */
    private String description;

    /**
     * 子节点
     */
    private List<PermissionDto> children;
}
