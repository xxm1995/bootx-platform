package cn.bootx.iam.code;

/**   
* 登录方式
* @author xxm  
* @date 2021/8/2 
*/
public interface OpenIdLoginType {

    /** 手机号登录 */
    String PHONE = "phone";

    /** 微信登录 */
    String WE_CHAT = "weChat";

    /** 微信登录 */
    String QQ = "qq";

    /** 码云 */
    String GITEE = "gitee";

    /** 钉钉登录 */
    String DING_TALK_ID = "dingTalkId";

    /** 企业微信 */
    String WE_COM = "weCom";
}
