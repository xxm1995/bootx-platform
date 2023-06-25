package cn.bootx.platform.notice.code;

/**
 * 消息模板类型
 *
 * @author xxm
 * @since 2021/8/10
 */
public interface MessageTemplateCode {

    /** 站内信 */
    int SITE = 0;

    /** 钉钉 */
    int DING_TALK = 1;

    /** 钉钉机器人 */
    int DING_TALK_ROBOT = 2;

    /** 短信 */
    int SMS = 3;

    /** Email */
    int EMAIL = 4;

    /** 微信 */
    int WECHAT = 5;

}
