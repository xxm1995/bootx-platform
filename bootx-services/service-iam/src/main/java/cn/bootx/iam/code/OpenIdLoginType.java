package cn.bootx.iam.code;

/**   
* 登三方平台录方式
* @author xxm  
* @date 2021/8/2 
*/
public interface OpenIdLoginType {

    // 参数
    /** 第三方平台授权码 */
    String AUTH_CODE = "authCode";
    /**
     * 访问AuthorizeUrl后回调时带的参数state，用于和请求AuthorizeUrl前的state比较，防止CSRF攻击
     */
    String STATE = "state";


    /** 手机号登录 */
    String PHONE = "phone";

    /** 微信登录 */
    String WE_CHAT = "weChat";

    /** qq登录 */
    String QQ = "qq";

    /** 码云 */
    String GITEE = "gitee";

    /** 钉钉登录 */
    String DING_TALK = "dingTalk";

    /** 企业微信 */
    String WE_COM = "weCom";
}
