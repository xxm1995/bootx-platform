package cn.bootx.notice.code;

/**   
* 消息模板类型
* @author xxm  
* @date 2021/8/10 
*/
public interface MessageTemplateCode {

    /** 钉钉 */
    int DING_TALK = 1;

    /** 钉钉机器人 */
    int DING_TALK_ROBOT = 2;

    /** 钉钉机器人 */
    int SMS = 3;

    /** Email */
    int EMAIL = 4;

    /** 微信 */
    int WECHAT = 5;
}
