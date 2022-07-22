package cn.bootx.notice.core.dingtalk.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.notice.core.dingtalk.entity.corp.*;
import cn.bootx.notice.core.dingtalk.entity.msg.*;
import cn.bootx.notice.service.DingTalkNoticeSender;
import cn.bootx.starter.dingtalk.configuration.DingTalkProperties;
import cn.bootx.starter.dingtalk.core.base.entity.DingTalkResult;
import cn.bootx.starter.dingtalk.core.notice.entity.ChatNoticeResult;
import cn.bootx.starter.dingtalk.core.notice.entity.CorpNoticeResult;
import cn.bootx.starter.dingtalk.param.notice.ChatNotice;
import cn.bootx.starter.dingtalk.param.notice.CorpNotice;
import cn.bootx.starter.dingtalk.param.notice.RecallCorpNotice;
import cn.bootx.starter.dingtalk.param.notice.UpdateCorpNotice;
import cn.bootx.starter.dingtalk.core.notice.service.DingNoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

import static cn.bootx.starter.dingtalk.code.DingTalkCode.SUCCESS_CODE;

/**
 * 钉钉消息通知
 * @author xxm
 * @date 2022/7/16
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DingTalkNoticeSenderImpl implements DingTalkNoticeSender {
    private final DingNoticeService dingNoticeService;
    private final DingTalkProperties dingTalkProperties;

    /**
     * 发送文本消息
     * @return 发布消息任务ID
     */
    @Override
    public Long sendTextCorpNotice(DingTextMsg dingTextMsg, DingCorpNoticeReceive receive){
        return this.sendCorpNotice(dingTextMsg,receive);
    }

    /**
     * 发送图片消息
     * @return 发布消息任务ID
     */
    @Override
    public Long sendImageCorpNotice(DingImageMsg dingImageMsg, DingCorpNoticeReceive receive){
        return this.sendCorpNotice(dingImageMsg,receive);
    }

    /**
     * 发送语音消息
     * @return 发布消息任务ID
     */
    @Override
    public Long sendVoiceCorpNotice(DingVoiceMsg dingVoiceMsg, DingCorpNoticeReceive receive) {
        return this.sendCorpNotice(dingVoiceMsg,receive);
    }

    /**
     * 发送文件消息
     * @return 发布消息任务ID
     */
    @Override
    public Long sendFileCorpNotice(DingFileMsg dingFileMsg, DingCorpNoticeReceive receive) {
        return this.sendCorpNotice(dingFileMsg,receive);
    }

    /**
     * 发送链接消息
     * @return 发布消息任务ID
     */
    @Override
    public Long sendLinkCorpNotice(DingLinkMsg dingLinkMsg, DingCorpNoticeReceive receive) {
        return this.sendCorpNotice(dingLinkMsg,receive);
    }

    /**
     * 发送OA消息
     * @return 发布消息任务ID
     */
    @Override
    public Long sendOaCorpNotice(DingOaMsg dingOaMsg, DingCorpNoticeReceive receive) {
        return this.sendCorpNotice(dingOaMsg,receive);
    }

    /**
     * 发送markdown消息
     */
    @Override
    public Long sendMarkDownCorpNotice(DingMarkDownMsg dingMarkDownMsg, DingCorpNoticeReceive receive) {
        return this.sendCorpNotice(dingMarkDownMsg,receive);
    }

    /**
     * 发送卡片消息
     */
    @Override
    public Long sendActionCardCorpNotice(DingActionCardMsg dingActionCardMsg, DingCorpNoticeReceive receive) {
        return this.sendCorpNotice(dingActionCardMsg,receive);
    }

    /**
     * 返回任务id(OA消息更新状态使用)
     */
    private Long sendCorpNotice(DingMsg dingMsg, DingCorpNoticeReceive receive){
        DingCorpNoticeParam dingCorpNoticeParam = new DingCorpNoticeParam(receive, dingMsg);
        CorpNotice corpNotice = dingCorpNoticeParam.toDingCorpNotice();
        corpNotice.setAgentId(dingTalkProperties.getAgentId());
        CorpNoticeResult result = dingNoticeService.sendCorpNotice(corpNotice);

        if (!Objects.equals(result.getCode(),SUCCESS_CODE)){
            throw new BizException(result.getMsg());
        }
        return result.getTaskId();
    }

    /**
     *  更新OA工作通知消息
     */
    @Override
    public void updateOaCorpNotice(DingCorpNoticeUpdate updateCorpNotice){
        UpdateCorpNotice dingUpdateCorpNotice = updateCorpNotice.toDingUpdateCorpNotice();
        dingUpdateCorpNotice.setAgentId(dingTalkProperties.getAgentId());
        CorpNoticeResult result = dingNoticeService.updateCorpNotice(dingUpdateCorpNotice);
        if (!Objects.equals(result.getCode(),SUCCESS_CODE)){
            throw new BizException(result.getMsg());
        }
    }

    /**
     * 撤回工作通知消息
     */
    @Override
    public void recallCorpNotice(Long msgTaskId){
        RecallCorpNotice recallCorpNotice = new RecallCorpNotice(dingTalkProperties.getAgentId(),msgTaskId);
        DingTalkResult<?> result = dingNoticeService.recallCorpNotice(recallCorpNotice);
        if (!Objects.equals(result.getCode(),SUCCESS_CODE)){
            throw new BizException(result.getMsg());
        }
    }

    /**
     * 发送文本企业群消息
     * @return 发布企业群消息ID
     */
    @Override
    public String sendTextChatNotice(DingTextMsg dingTextMsg, String chatId){
        return this.sendChatNotice(dingTextMsg,chatId);
    }

    /**
     * 发送图片企业群消息
     * @return 发布企业群消息ID
     */
    @Override
    public String sendImageChatNotice(DingImageMsg dingImageMsg, String chatId){
        return this.sendChatNotice(dingImageMsg,chatId);
    }

    /**
     * 发送语音企业群消息
     * @return 发布企业群消息ID
     */
    @Override
    public String sendVoiceChatNotice(DingVoiceMsg dingVoiceMsg, String chatId) {
        return this.sendChatNotice(dingVoiceMsg,chatId);
    }

    /**
     * 发送文件企业群消息
     * @return 发布企业群消息ID
     */
    @Override
    public String sendFileChatNotice(DingFileMsg dingFileMsg, String chatId) {
        return this.sendChatNotice(dingFileMsg,chatId);
    }

    /**
     * 发送链接企业群消息
     * @return 发布企业群消息ID
     */
    @Override
    public String sendLinkChatNotice(DingLinkMsg dingLinkMsg, String chatId) {
        return this.sendChatNotice(dingLinkMsg,chatId);
    }

    /**
     * 发送OA企业群消息
     * @return 发布企业群消息ID
     */
    @Override
    public String sendOaChatNotice(DingOaMsg dingOaMsg, String chatId) {
        return this.sendChatNotice(dingOaMsg,chatId);
    }

    /**
     * 发送markdown企业群消息
     */
    @Override
    public String sendMarkDownChatNotice(DingMarkDownMsg dingMarkDownMsg, String chatId) {
        return this.sendChatNotice(dingMarkDownMsg,chatId);
    }

    /**
     * 发送卡片企业群消息
     */
    @Override
    public String sendActionCardChatNotice(DingActionCardMsg dingActionCardMsg, String chatId) {
        return this.sendChatNotice(dingActionCardMsg,chatId);
    }

    /**
     * 发送企业群消息
     */
    private String sendChatNotice(DingMsg dingMsg, String chatId){

        ChatNotice chatNotice = new ChatNotice(chatId, dingMsg.toDingMsg());
        ChatNoticeResult result = dingNoticeService.sendChatNotice(chatNotice);
        if (!Objects.equals(result.getCode(),SUCCESS_CODE)){
            throw new BizException(result.getMsg());
        }
        return result.getMessageId();
    }
}
