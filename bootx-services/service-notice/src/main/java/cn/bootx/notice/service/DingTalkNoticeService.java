package cn.bootx.notice.service;

import cn.bootx.starter.dingtalk.param.notice.msg.DingLinkMsg;
import cn.bootx.starter.dingtalk.param.notice.msg.DingMarkdownMsg;
import cn.bootx.starter.dingtalk.param.notice.msg.DingTextMsg;

/**
* 钉钉消息通知服务
* @author xxm  
* @date 2022/7/16 
*/
public interface DingTalkNoticeService {

    /**
     * 简单文本消息发送
     */
    void sendSimpleText(String code,String msg);

    /**
     * 文本消息发送
     */
    void sendText(String code, DingTextMsg dingTalkTextNotice);
    /**
     * 发送链接消息
     */
    void sendLink(String code, DingLinkMsg notice);

    /**
     * 发送Markdown消息
     */
    void sendMarkdown(String code, DingMarkdownMsg notice);
}
