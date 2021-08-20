package cn.bootx.common.core.rest;

/**
 * 公用错误码定义类
 * 10001-10100
 */
public interface CommonErrorCodes {

    // 系统错误
    int SYSTEM_ERROR = 10001;
    // 远程调用错误
    int REMOTE_CALL_ERROR = 10002;
    // 认证失败
    int AUTHENTICATION_FAIL = 10004;
    // 参数处理失败
    int PARSE_PARAMETERS_ERROR = 10005;
    // 参数验证失败
    int VALIDATE_PARAMETERS_ERROR = 10006;
    // 重复操作异常
    int REPETITIVE_OPERATION_ERROR = 10007;
    // 数据过期
    int DATA_OUT_OF_DATE = 10008;
    // 不支持的下载
    int UN_SUPPORTED_READ = 1009;

    // 未知异常
    int UNKNOWN_ERROR = -1;
}
