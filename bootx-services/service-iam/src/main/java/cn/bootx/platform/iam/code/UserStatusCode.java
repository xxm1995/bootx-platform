package cn.bootx.platform.iam.code;

/**
 * 用户状态码
 *
 * @author xxm
 * @since 2021/9/9
 */
public interface UserStatusCode {

    /** 正常 */
    int NORMAL = 1;

    /** 多次登录失败被锁定 */
    int LOCK = 2;

    /** 封禁 */
    int BAN = 3;

}
