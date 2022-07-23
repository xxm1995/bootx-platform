package cn.bootx.notice.core.wecom.service;

import cn.bootx.notice.core.wecom.entity.WeComNoticeParam;
import cn.bootx.notice.core.wecom.entity.WeComNoticeReceive;
import cn.bootx.notice.core.wecom.entity.msg.*;
import cn.bootx.notice.service.WeComNoticeSender;
import cn.bootx.starter.wecom.core.notice.service.WeComNoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 实现类
* @author xxm  
* @date 2022/7/23 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class WeComNoticeSenderImpl implements WeComNoticeSender {
    private final WeComNoticeService weComNoticeService;

    /**
     * 发送文本消息
     */
    @Override
    public String sendTextNotice(WeComTextMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送图片消息
     */
    @Override
    public String sendImageNotice(WeComImageMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送语音消息
     */
    @Override
    public String sendVoiceNotice(WeComVoiceMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送视频消息
     */
    @Override
    public String sendVideoNotice(WeComVideoMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送文本卡片消息
     */
    @Override
    public String sendTextCardNotice(WeComTextCardMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送图文消息
     */
    @Override
    public String sendNewsNotice(WeComNewsMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送图文消息(mpnews)
     */
    @Override
    public String sendMpNewsNotice(WeComMpNewsMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送markdown消息
     */
    @Override
    public String sendMarkdownNotice(WeComMarkdownMsg msg, WeComNoticeReceive receive){
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送企微信息
     */
    private String sendNotice(WeComMsg msg, WeComNoticeReceive receive){
        WeComNoticeParam weComNoticeParam = new WeComNoticeParam(receive, msg);
        return weComNoticeService.sendNotice(weComNoticeParam.toWeComNotice());
    }

    /**
     * 撤回企微消息
     */
    @Override
    public void recallNotice(String msgId){
        weComNoticeService.recallNotice(msgId);
    }
}
