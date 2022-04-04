package cn.bootx.starter.dingtalk.code;

/**   
* 钉钉消息类型
* @author xxm  
* @date 2020/11/30 
*/
public interface DingTalkCode {

    /** 钉钉机器人基本url */
    String ROBOT_BASE_URL = "https://oapi.dingtalk.com/robot/";
    /** 带sign的消息发送请求 */
    String ROBOT_SEND_SIGN_URL = ROBOT_BASE_URL +"send?access_token={accessToken}&timestamp={timestamp}&sign={sign}";
    /** 不带sign的消息发送请求 */
    String ROBOT_SEND_NOT_SIGN_URL = ROBOT_BASE_URL +"send?access_token={accessToken}";
    /** 内部应用access_token */
    String APP_ACCESS_TOKEN_URL = "https://oapi.dingtalk.com/gettoken?appkey={appKey}&appsecret={appSecret}";
    /** 用户access_token */
    String USER_ACCESS_TOKEN_URL = "https://oapi.dingtalk.com//v1.0/oauth2/userAccessToken";
    /** 钉钉三方登录 */
    String THIRD_LOGIN_URL = "https://login.dingtalk.com/oauth2/auth?" +
            "redirect_uri={redirectUri}" +
            "&response_type={responseType}" +
            "&client_id={clientId}" +
            "&scope={scope}" +
            "&state={state}" +
            "&prompt={prompt}";


    /** 钉钉字段 */
    String ACCESS_TOKEN = "accessToken";
    String SIGN = "sign";
    String TIMESTAMP = "timestamp";
    String APP_KEY = "appKey";
    String APP_SECRET = "appSecret";
    // 应用id
    String CLIENT_ID = "clientId";
    // 应用密钥
    String CLIENT_SECRET = "clientSecret";
    String CODE = "code";
    // OAuth2.0刷新令牌，从返回结果里面获取。
    String REFRESH_TOKEN = "refreshToken";
    String GRANT_TYPE = "grantType";
    String RESPONSE_TYPE = "responseType";
    String SCOPE = "scope";
    String REDIRECT_URI = "redirectUri";
    String STATE = "state";
    String PROMPT = "prompt";


    /** 认证字段 */
    // 授权码换token
    String AUTH_AUTHORIZATION_CODE = "authorization_code";
    // 刷新token换用户token
    String AUTH_REFRESH_TOKEN = "refresh_token";
    // OPEN_ID
    String OPEN_ID = "openid";

}
