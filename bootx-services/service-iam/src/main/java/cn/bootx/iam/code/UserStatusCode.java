package cn.bootx.iam.code;

/**   
* 用户状态码
* @author xxm  
* @date 2021/9/9 
*/
public interface UserStatusCode {

    /** 正常 */
    int NORMAL = 1;

    /** 未激活 */
    int INACTIVATED = 2;

    /** 封禁 */
    int BAN = 3;
}
