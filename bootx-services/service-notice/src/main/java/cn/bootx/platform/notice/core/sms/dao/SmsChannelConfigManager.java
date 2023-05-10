package cn.bootx.platform.notice.core.sms.dao;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.notice.core.sms.entity.SmsChannelConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class SmsChannelConfigManager extends BaseManager<SmsChannelConfigMapper, SmsChannelConfig> {
}
