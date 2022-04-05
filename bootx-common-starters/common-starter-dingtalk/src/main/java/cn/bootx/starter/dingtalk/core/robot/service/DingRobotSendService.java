package cn.bootx.starter.dingtalk.core.robot.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.starter.dingtalk.code.DingTalkCode;
import cn.bootx.starter.dingtalk.core.robot.dao.DingRobotConfigManage;
import cn.bootx.starter.dingtalk.core.robot.entity.DingRobotConfig;
import cn.bootx.starter.dingtalk.dto.common.DingTalkResult;
import cn.bootx.starter.dingtalk.param.notice.DingTalkLinkNotice;
import cn.bootx.starter.dingtalk.param.notice.DingTalkMarkdownNotice;
import cn.bootx.starter.dingtalk.param.notice.DingTalkNotice;
import cn.bootx.starter.dingtalk.param.notice.DingTalkTextNotice;
import cn.bootx.starter.dingtalk.util.DingTalkUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
* 钉钉机器人消息发送
* @author xxm
* @date 2020/11/29
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DingRobotSendService {
    private final DingRobotConfigManage dingRobotConfigManage;


    /**
     * 发送text
     */
    public DingTalkResult<?> sendText(String code, DingTalkTextNotice notice){
        return this.sendNotice(code,notice);
    }
    /**
     * 发送text
     */
    public DingTalkResult<?> sendLink(String code, DingTalkLinkNotice notice){
        return this.sendNotice(code,notice);
    }
    /**
     * 发送text
     */
    public DingTalkResult<?> sendMarkdown(String code, DingTalkMarkdownNotice notice){
        return this.sendNotice(code,notice);
    }

    /**
     * 发送钉钉机器人消息
     */
    private DingTalkResult<?> sendNotice(String code, DingTalkNotice body) {
        DingRobotConfig dingRobotConfig = dingRobotConfigManage.findByCode(code).orElseThrow(() -> new BizException("钉钉机器人配置不存在"));
        long timestamp = System.currentTimeMillis();

        Map<String, Object> map = new HashMap<>(3);
        map.put(DingTalkCode.ACCESS_TOKEN, dingRobotConfig.getAccessToken());
        String url;
        // 验签
        if (dingRobotConfig.isEnableSignatureCheck()){
            url = DingTalkCode.ROBOT_SEND_SIGN_URL;
            map.put(DingTalkCode.SIGN, DingTalkUtil.generateSign(timestamp, dingRobotConfig.getSignSecret()));
            map.put(DingTalkCode.TIMESTAMP, timestamp);
        }else {
            url = DingTalkCode.ROBOT_SEND_NOT_SIGN_URL;
        }

        // 请求消息
        String responseBody = HttpUtil.createPost(StrUtil.format(url, map))
                .body(JacksonUtil.toJson(body))
                .execute()
                .body();
        DingTalkResult<?> dingTalkResult = JacksonUtil.toBean(responseBody, DingTalkResult.class);
        if (!Objects.equals(0,dingTalkResult.getCode())){
            log.error("钉钉机器人发送消息失败: {}",dingTalkResult.getMsg());
        }
        return dingTalkResult;
    }

}
