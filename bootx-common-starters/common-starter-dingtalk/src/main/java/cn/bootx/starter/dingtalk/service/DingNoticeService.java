package cn.bootx.starter.dingtalk.service;

import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.starter.dingtalk.dto.notice.CorpNoticeResult;
import cn.bootx.starter.dingtalk.param.notice.DingCorpNotice;
import cn.bootx.starter.dingtalk.param.notice.DingUpdateCorpNotice;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import static cn.bootx.starter.dingtalk.code.DingTalkCode.NOTICE_CORP_CONVERSATION_URL;

/**
* 钉钉通知发送服务
* @author xxm
* @date 2022/7/17
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DingNoticeService {
    private final DingAccessService dingAccessService;

    /**
     * 发送普通消息, 支持普通群和个人会话
     *
     * @url <a href="https://open.dingtalk.com/document/orgapp-server/send-normal-messages">...</a>
     */
    public void sendNotice() {
    }

    /**
     * 发送工作通知
     *
     * @url <a href="https://open.dingtalk.com/document/orgapp-server/asynchronous-sending-of-enterprise-session-messages">...</a>
     */
    public CorpNoticeResult sendCorpNotice(DingCorpNotice param) {
        String accessToken = dingAccessService.getAccessToken();
        String responseBody = HttpUtil.createPost(StrUtil.format(NOTICE_CORP_CONVERSATION_URL, accessToken))
                .body(param.toParam())
                .execute()
                .body();
        return JacksonUtil.toBean(responseBody, CorpNoticeResult.class);
    }

    /**
     * 更新工作通知状态栏
     * @url <a href="https://open.dingtalk.com/document/orgapp-server/update-work-notification-status-bar">...</a>
     */
    public CorpNoticeResult updateCorpNotice(DingUpdateCorpNotice param) {
        String accessToken = dingAccessService.getAccessToken();
        String responseBody = HttpUtil.createPost(StrUtil.format(NOTICE_CORP_CONVERSATION_URL, accessToken))
                .body(param.toParam())
                .execute()
                .body();
        return JacksonUtil.toBean(responseBody, CorpNoticeResult.class);
    }

    /**
     * 撤回工作通知消息
     * @url <a href="https://open.dingtalk.com/document/orgapp-server/notification-of-work-withdrawal">...</a>
     */
    public void recallCorpNotice(){

    }
}
