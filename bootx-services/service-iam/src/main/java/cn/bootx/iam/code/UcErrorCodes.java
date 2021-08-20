package cn.bootx.iam.code;

/**
* 用户中心错误码(21000-21999)
* @author xxm
* @date 2020/4/24 16:01
*/
public interface UcErrorCodes {


    /**
     * 用户Email已存在
     */
    int USER_EMAIL_ALREADY_EXISTED = 21014;
    /**
     * 用户手机号已存在
     */
    int USER_PHONE_ALREADY_EXISTED = 21015;

    /**
     * 用户信息不存在
     */
    int USER_INFO_NOT_EXISTS = 21020;

    /**
     * 用户手机号重复(批量导入)
     */
    int DUPLICATE_PHONE_NUMBER = 21022;

    /**
     * 用户邮箱重复(批量导入)
     */
    int DUPLICATE_EMAIL_ADDRESS = 21023;

    /**
     * 邮箱和手机号均为空的异常
     */
    int NONE_PHONE_AND_EMAIL = 21024;

    /** 角色已存在 */
    int ROLE_ALREADY_EXISTED = 21025;

    /** 角色不存在 */
    int ROLE_NOT_EXISTED = 21026;

    /** 角色已经被使用 */
    int ROLE_ALREADY_USED = 21027;

    /** 权限操作错误 */
    int PERMISSION_DB_ERROR = 21028;

    /** 没有访问权限 */
    int PERMISSION_NOT_EXIST = 21029;

}
