package cn.bootx.iam.code;

/**   
* 数据范围权限类型
* @author xxm  
* @date 2021/12/24 
*/
public interface DataScopeCode {

    /** 自己的数据 */
    int SELF = 1;
    /** 指定用户级别 */
    int USER_SCOPE = 2;
    /** 指定部门级别 */
    int DEPT_SCOPE = 3;
    /** 指定部门与用户级别 */
    int DEPT_AND_USER_SCOPE = 4;
    /** 全部数据 */
    int ALL_SCOPE = 5;
}
