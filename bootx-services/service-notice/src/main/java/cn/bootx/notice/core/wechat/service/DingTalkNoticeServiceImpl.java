package cn.bootx.notice.core.wechat.service;

import cn.bootx.notice.service.DingTalkNoticeService;
import cn.bootx.starter.dingtalk.core.robot.service.DingRobotSendService;
import cn.bootx.starter.dingtalk.param.notice.msg.DingLinkMsg;
import cn.bootx.starter.dingtalk.param.notice.msg.DingMarkdownMsg;
import cn.bootx.starter.dingtalk.param.notice.msg.DingTextMsg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
* 钉钉消息通知
* @author xxm
* @date 2022/7/16
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DingTalkNoticeServiceImpl implements DingTalkNoticeService {
    private final DingRobotSendService dingRobotSendService;

    @Override
    public void sendSimpleText(String code, String msg) {
        DingTextMsg dingTalkTextNotice = new DingTextMsg(msg);
        dingRobotSendService.sendNotice(code,dingTalkTextNotice);
    }

    @Override
    public void sendText(String code, DingTextMsg dingTalkTextNotice) {
        dingRobotSendService.sendNotice(code,dingTalkTextNotice);
    }

    @Override
    public void sendLink(String code, DingLinkMsg notice){
        dingRobotSendService.sendNotice(code,notice);
    }

    @Override
    public void sendMarkdown(String code, DingMarkdownMsg notice){
        dingRobotSendService.sendNotice(code,notice);
    }
}
