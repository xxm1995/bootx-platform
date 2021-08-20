package cn.bootx.notice.code;

/**   
* 钉钉消息类型
* @author xxm  
* @date 2020/11/30 
*/
public interface DingTalkCode {
    /** 消息类型 */
    String MSG_TEXT = "text";
    String MSG_LINK = "link";
    String MSG_MARKDOWN = "markdown";
    String MSG_ACTION_CARD = "ActionCard";

    /** 钉钉机器人基本url */
    String BASE_URL = "https://oapi.dingtalk.com/robot/";
    /** 带sign的消息发送请求 */
    String SEND_SIGN_URL = BASE_URL+"send?access_token={accessToken}&timestamp={timestamp}&sign={sign}";
    /** 不带sign的消息发送请求 */
    String SEND_NOT_SIGN_URL = BASE_URL+"send?access_token={accessToken}";

    /** 钉钉配置 */
    String ACCESS_TOKEN = "accessToken";
    String SIGN = "sign";
    String TIMESTAMP = "timestamp";
}
