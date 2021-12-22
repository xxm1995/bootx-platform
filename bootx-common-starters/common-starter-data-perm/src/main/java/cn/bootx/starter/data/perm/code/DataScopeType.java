package cn.bootx.starter.data.perm.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
* 数据范围权限类型
* @author xxm
* @date 2021/12/22
*/
@Getter
@AllArgsConstructor
public enum DataScopeType {
    /** 自己的数据 */
    SELF,
    /** 指定用户级别 */
    USER_SCOPE,
    /** 指定部门级别 */
    DEPT_SCOPE,
    /** 指定部门与用户级别 */
    DEPT_AND_USER_SCOPE,
    /** 全部数据 */
    ALL_SCOPE;
}
