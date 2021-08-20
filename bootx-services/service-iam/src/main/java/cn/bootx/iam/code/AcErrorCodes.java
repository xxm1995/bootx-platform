package cn.bootx.iam.code;

/**
* 任重中心错误码 (22200-22999)
* @author xxm
* @date 2020/4/24 16:01
*/
public interface AcErrorCodes {

    /**
     * 用户账号已存在
     */
    int USER_ACCOUNT_ALREADY_EXISTED = 22010;
    /**
     * 用户账号不存在
     */
    int USER_ACCOUNT_NOT_EXISTED = 22011;
    /**
     * 用户认证已存在
     */
    int USER_AUTH_ALREADY_EXISTED = 22012;
    /**
     * 用户认证不存在
     */
    int USER_AUTH_NOT_EXISTED = 22013;
    /**
     * 用户Email已存在
     */
    int USER_EMAIL_ALREADY_EXISTED = 22014;
    /**
     * 用户手机号已存在
     */
    int USER_PHONE_ALREADY_EXISTED = 22015;

    /**
     * 密码不正确
     */
    int USER_PASSWORD_INVALID = 22016;
    /**
     * 旧密码不正确
     */
    int USER_OLD_PASSWORD_INVALID = 22017;

    /**
     * 账户未激活
     */
    int USER_ACCOUNT_UNACTIVE = 22018;
    /**
     * 不支持的登录
     */
    int UN_SUPPORTED_LOGIN = 22019;

    /**
     * 用户自动登录失败
     */
    int USER_AUTH_CODE_LOGIN_FAIL = 22021;

    /**
     * 用户手机号重复(批量导入)
     */
    int DUPLICATE_PHONE_NUMBER = 22022;

    /**
     * 用户邮箱重复(批量导入)
     */
    int DUPLICATE_EMAIL_ADDRESS = 22023;

}
