package cn.bootx.starter.wecom;

/**
* 企微常量
* @author xxm
* @date 2022/7/23
*/
public interface WeComCode {
    /* 请求地址 */
    /** 撤回应用消息 */
    String NOTICE_RECALL_URL = "https://qyapi.weixin.qq.com/cgi-bin/message/recall";

    /* 消息通知 */
    /** 消息ID */
    String NOTICE_MSG_ID = "msgid";
}
