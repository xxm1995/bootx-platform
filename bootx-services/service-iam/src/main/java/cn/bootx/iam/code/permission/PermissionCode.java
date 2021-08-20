package cn.bootx.iam.code.permission;

/**   
* 权限相关编码
* @author xxm  
* @date 2021/7/12 
*/
public interface PermissionCode {
    /**
     *  0：顶级菜单
     */
    Integer MENU_TYPE_TOP = 0;
    /**
     *  1：子菜单 
     */
    Integer MENU_TYPE_SUB = 1;
    /**
     *  2：按钮权限
     */
    Integer MENU_TYPE_BUTTON  = 2;
}
