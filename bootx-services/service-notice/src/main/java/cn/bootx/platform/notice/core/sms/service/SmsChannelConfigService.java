package cn.bootx.platform.notice.core.sms.service;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.exception.DataNotExistException;
import cn.bootx.platform.common.core.function.CollectorsFunction;
import cn.bootx.platform.common.jackson.util.JacksonUtil;
import cn.bootx.platform.notice.core.sms.dao.SmsChannelConfigManager;
import cn.bootx.platform.notice.core.sms.entity.SmsChannelConfig;
import cn.bootx.platform.notice.dto.sms.SmsChannelConfigDto;
import cn.bootx.platform.notice.event.sms.SmsChannelAddEvent;
import cn.bootx.platform.notice.event.sms.SmsChannelUpdateEvent;
import cn.bootx.platform.notice.param.sms.SmsChannelConfigParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
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
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class SmsChannelConfigService {

    private final SmsChannelConfigManager configManager;

    private final ApplicationEventPublisher eventPublisher;

    /**
     * 查询全部配置
     */
    public List<SmsChannelConfigDto> findAll(){
        // 遍历数据库
        Map<String, SmsChannelConfig> map = configManager.findAll()
                .stream()
                .collect(Collectors.toMap(SmsChannelConfig::getCode, Function.identity(), CollectorsFunction::retainLatest));
        return Arrays.stream(SupplierType.values())
                .map(type-> Optional.ofNullable(map.get(type.name().toLowerCase()))
                        .orElse(new SmsChannelConfig()
                                .setCode(type.name().toLowerCase())
                                .setSortNo(0.0)
                                .setName(type.getName())))
                .sorted(Comparator.comparing(SmsChannelConfig::getSortNo))
                .map(SmsChannelConfig::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 添加
     */
    public void add(SmsChannelConfigParam param){
        SmsChannelConfig channelConfig = SmsChannelConfig.init(param);
        // 编码不能重复
        if (configManager.existsByCode(param.getCode())) {
            throw new BizException("编码已存在");
        }
        configManager.save(channelConfig);
        this.initChannelConfig(channelConfig);
        eventPublisher.publishEvent(new SmsChannelAddEvent(this,channelConfig.toDto()));
    }

    /**
     * 更新
     */
    public void update(SmsChannelConfigParam param){
        SmsChannelConfig channelConfig = configManager.findById(param.getId())
                .orElseThrow(DataNotExistException::new);
        // 编码不能重复
        if (configManager.existsByCode(param.getCode(), param.getId())) {
            throw new BizException("编码已存在");
        }
        BeanUtil.copyProperties(param, channelConfig, CopyOptions.create().ignoreNullValue());
        configManager.updateById(channelConfig);
        this.initChannelConfig(channelConfig);
        eventPublisher.publishEvent(new SmsChannelUpdateEvent(this,channelConfig.toDto()));
    }

    /**
     * 根据创查询
     */
    public SmsChannelConfigDto findByCode(String code) {
        return configManager.findByCode(code).map(SmsChannelConfig::toDto)
                .orElseThrow(DataNotExistException::new);
    }

    /**
     * 启动成功后初始化所有的短信通道配置
     */
    @EventListener(WebServerInitializedEvent.class)
    public void initChannelConfig(){
        List<SmsChannelConfig> smsChannelConfigs = configManager.findAll();
        smsChannelConfigs.forEach(this::initChannelConfig);
    }

    /**
     * 启动成功后初始化所有的短信通道配置
     */
    public void initChannelConfig(SmsChannelConfig channelConfig){
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
