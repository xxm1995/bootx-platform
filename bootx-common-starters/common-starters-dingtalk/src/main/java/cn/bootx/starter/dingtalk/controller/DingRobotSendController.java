package cn.bootx.starter.dingtalk.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.dingtalk.core.robot.service.DingRobotSendService;
import cn.bootx.starter.dingtalk.dto.common.DingTalkResult;
import cn.bootx.starter.dingtalk.param.notice.DingTalkLinkNotice;
import cn.bootx.starter.dingtalk.param.notice.DingTalkMarkdownNotice;
import cn.bootx.starter.dingtalk.param.notice.DingTalkTextNotice;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

/**
 * @author xxm
 * @date 2020/11/29
 */
@Tag(name ="钉钉机器人发送")
@RestController
@RequestMapping("/ding/robot/send")
@AllArgsConstructor
public class DingRobotSendController {
    private final DingRobotSendService dingRobotSendService;

    @Operation(summary = "测试发送text")
    @PostMapping("/text")
    public ResResult<DingTalkResult<?>> sendText(){
        DingTalkTextNotice notice = new DingTalkTextNotice("hello dingTalk!",Collections.singletonList("17051008321"));
        return Res.ok(dingRobotSendService.sendText("bootx",notice));
    }

    @Operation(summary = "测试发送link")
    @PostMapping("/link")
    public ResResult<DingTalkResult<?>> sendLink(){
        DingTalkLinkNotice notice = new DingTalkLinkNotice("时代的火车向前开", "这个即将发布的新版本，创始人xx称它为红树林", "https://www.dingtalk.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI");

        return Res.ok(dingRobotSendService.sendLink("bootx",notice));
    }

    @Operation(summary = "测试发送Markdown")
    @PostMapping("/markdown")
    public ResResult<DingTalkResult<?>> sendMarkdown(){
        DingTalkMarkdownNotice notice = new DingTalkMarkdownNotice("杭州天气","#### 杭州天气\n > 9度，西北风1级，空气良89，相对温度73%\n > ![screenshot](https://img.alicdn.com/tfs/TB1NwmBEL9TBuNjy1zbXXXpepXa-2400-1218.png)\n > ###### 10点20分发布 [天气](https://www.dingtalk.com) \n"
                ,Collections.singletonList("17051008321"));
        return Res.ok(dingRobotSendService.sendMarkdown("bootx",notice));
    }
}
