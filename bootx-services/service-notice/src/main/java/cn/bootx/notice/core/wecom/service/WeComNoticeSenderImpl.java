package cn.bootx.notice.core.wecom.service;

import cn.bootx.notice.core.wecom.entity.WeComNoticeParam;
import cn.bootx.notice.core.wecom.entity.WeComNoticeReceive;
import cn.bootx.notice.core.wecom.entity.msg.*;
import cn.bootx.notice.service.WeComNoticeSender;
import cn.bootx.starter.wecom.core.base.domin.UploadMedia;
import cn.bootx.starter.wecom.core.notice.service.WeComNoticeService;
import cn.hutool.core.io.FileTypeUtil;
import cn.hutool.core.io.IoUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

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
     * 发送图片消息 (传入文件)
     */
    @Override
    public String sendImageNotice(InputStream inputStream, WeComNoticeReceive receive){
        byte[] bytes = IoUtil.readBytes(inputStream);
        String type = FileTypeUtil.getType(new ByteArrayInputStream(bytes));
        UploadMedia uploadMedia = new UploadMedia()
                .setMediaType(WxConsts.MediaFileType.IMAGE)
                .setFileType(type)
                .setInputStream(new ByteArrayInputStream(bytes));
        String media = weComNoticeService.updatedMedia(uploadMedia);
        WeComImageMsg msg = new WeComImageMsg(media);
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
     * 发送语音消息(传入文件)
     */
    @Override
    public String sendVoiceNotice(InputStream inputStream, WeComNoticeReceive receive){
        byte[] bytes = IoUtil.readBytes(inputStream);
        String type = FileTypeUtil.getType(new ByteArrayInputStream(bytes));
        UploadMedia uploadMedia = new UploadMedia()
                .setMediaType(WxConsts.MediaFileType.VOICE)
                .setFileType(type)
                .setInputStream(new ByteArrayInputStream(bytes));
        String media = weComNoticeService.updatedMedia(uploadMedia);
        WeComVoiceMsg msg = new WeComVoiceMsg(media);
        return this.sendNotice(msg,receive);
    }

    /**
     * 发送视频消息 (传入文件)
     */
    @Override
    public String sendVideoNotice(String title, String description, InputStream inputStream, WeComNoticeReceive receive){
        byte[] bytes = IoUtil.readBytes(inputStream);
        String type = FileTypeUtil.getType(new ByteArrayInputStream(bytes));
        UploadMedia uploadMedia = new UploadMedia()
                .setMediaType(WxConsts.MediaFileType.VIDEO)
                .setFileType(type)
                .setInputStream(new ByteArrayInputStream(bytes));
        String media = weComNoticeService.updatedMedia(uploadMedia);
        WeComVideoMsg msg = new WeComVideoMsg(title,media,description);
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
