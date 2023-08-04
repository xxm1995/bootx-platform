package cn.bootx.platform.notice.core.sms.service;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.function.CollectorsFunction;
import cn.bootx.platform.common.jackson.util.JacksonUtil;
import cn.bootx.platform.notice.core.sms.dao.SmsChannelConfigManager;
import cn.bootx.platform.notice.core.sms.entity.SmsChannelConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.sms4j.aliyun.config.AlibabaConfig;
import org.dromara.sms4j.cloopen.config.CloopenConfig;
import org.dromara.sms4j.comm.exception.SmsBlendException;
import org.dromara.sms4j.core.config.SupplierFactory;
import org.dromara.sms4j.ctyun.config.CtyunConfig;
import org.dromara.sms4j.emay.config.EmayConfig;
import org.dromara.sms4j.huawei.config.HuaweiConfig;
import org.dromara.sms4j.jdcloud.config.JdCloudConfig;
import org.dromara.sms4j.netease.config.NeteaseConfig;
import org.dromara.sms4j.provider.enumerate.SupplierType;
import org.dromara.sms4j.tencent.config.TencentConfig;
import org.dromara.sms4j.unisms.config.UniConfig;
import org.dromara.sms4j.yunpian.config.YunpianConfig;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class SmsChannelService {

    private final SmsChannelConfigManager smsChannelConfigManager;

    /**
     * 查询全部配置
     */
    public List<SmsChannelConfig> findAll(){
        // 遍历数据库
        Map<String, SmsChannelConfig> map = smsChannelConfigManager.findAll()
                .stream()
                .collect(Collectors.toMap(SmsChannelConfig::getCode, Function.identity(), CollectorsFunction::retainLatest));
        return Arrays.stream(SupplierType.values())
                .map(type-> Optional.ofNullable(map.get(type.name().toLowerCase()))
                        .orElse(new SmsChannelConfig()
                                .setCode(type.name().toLowerCase())
                                .setName(type.getName())))
                .collect(Collectors.toList());
    }

    /**
     * 添加
     */
    public void add(){

    }

    /**
     * 更新
     */
    public void update(){
    }

    /**
     * 启动成功初始化
     */
    @EventListener(WebServerInitializedEvent.class)
    public void init(){

        List<SmsChannelConfig> smsChannelConfigs = smsChannelConfigManager.findAll();

        for (SmsChannelConfig channelConfig : smsChannelConfigs) {
            SupplierType supplierType = getSupplierType(channelConfig.getCode());
            String config = channelConfig.getConfig();
            if (supplierType == SupplierType.ALIBABA) {
                SupplierFactory.setAlibabaConfig(JacksonUtil.toBean(config,AlibabaConfig.class));
            } else if (supplierType == SupplierType.HUAWEI) {
                SupplierFactory.setHuaweiConfig(JacksonUtil.toBean(config,HuaweiConfig.class));
            } else if (supplierType == SupplierType.UNI_SMS) {
                SupplierFactory.setUniConfig(JacksonUtil.toBean(config,UniConfig.class));
            } else if (supplierType == SupplierType.TENCENT) {
                SupplierFactory.setTencentConfig(JacksonUtil.toBean(config,TencentConfig.class));
            } else if (supplierType == SupplierType.YUNPIAN) {
                SupplierFactory.setYunpianConfig(JacksonUtil.toBean(config,YunpianConfig.class));
            } else if (supplierType == SupplierType.JD_CLOUD) {
                SupplierFactory.setJdCloudConfig(JacksonUtil.toBean(config,JdCloudConfig.class));
            } else if (supplierType == SupplierType.CLOOPEN) {
                SupplierFactory.setCloopenConfig(JacksonUtil.toBean(config,CloopenConfig.class));
            } else if (supplierType == SupplierType.EMAY) {
                SupplierFactory.setEmayConfig(JacksonUtil.toBean(config,EmayConfig.class));
            } else if (supplierType == SupplierType.CTYUN) {
                SupplierFactory.setCtyunConfig(JacksonUtil.toBean(config,CtyunConfig.class));
            } else if (supplierType == SupplierType.NETEASE) {
                SupplierFactory.setNeteaseConfig(JacksonUtil.toBean(config,NeteaseConfig.class));
            } else {
                throw new SmsBlendException("短信加载失败！请检查配置类型.");
            }
        }

    }

    /**
     * 获取 短信供应商 枚举
     */
    public SupplierType getSupplierType(String code){
        return Arrays.stream(SupplierType.values())
                .filter(supplierType -> supplierType.name().equalsIgnoreCase(code))
                .findFirst()
                .orElseThrow(() -> new BizException("短信供应商未找到"));
    }

}
