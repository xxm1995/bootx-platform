package cn.bootx.payment.core.paymodel.alipay.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.payment.core.paymodel.alipay.dao.AlipayConfigManager;
import cn.bootx.payment.core.paymodel.alipay.entity.AlipayConfig;
import cn.bootx.payment.dto.paymodel.alipay.AlipayConfigDto;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigParam;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigQuery;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.CharsetUtil;
import com.ijpay.alipay.AliPayApiConfig;
import com.ijpay.alipay.AliPayApiConfigKit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
 * 支付宝支付
 * @author xxm
 * @date 2020/12/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AlipayConfigService {
    private final AlipayConfigManager alipayConfigManager;

    /**
     * 添加支付宝配置
     */
    @Transactional(rollbackFor = Exception.class)
    public AlipayConfigDto add(AlipayConfigParam param){
        AlipayConfig alipayConfig = AlipayConfig.init(param);
        AlipayConfig save = alipayConfigManager.save(alipayConfig);
        return save.toDto();
    }

    /**
     * 设置启用的支付宝配置
     */
    @Transactional(rollbackFor = Exception.class)
    public void setUpActivity(Long id){
        AlipayConfig mailConfig = alipayConfigManager.findById(id).orElseThrow(() -> new BizException("支付宝配置不存在"));
        if (Objects.equals(mailConfig.getActivity(),Boolean.TRUE)){
            return;
        }
        alipayConfigManager.removeAllActivity();
        alipayConfigManager.updateById(mailConfig);
    }

    /**
     * 修改
     */
    @Transactional(rollbackFor = Exception.class)
    public AlipayConfigDto update(AlipayConfigParam param){
        AlipayConfig alipayConfig = alipayConfigManager.findById(param.getId())
                .orElseThrow(() -> new BizException("支付宝配置不存在"));
        BeanUtil.copyProperties(param,alipayConfig, CopyOptions.create().ignoreNullValue());
        // 支付方式
        if (CollUtil.isNotEmpty(param.getPayTypeList())){
            alipayConfig.setPayTypes(String.join(",", param.getPayTypeList()));
        } else {
            alipayConfig.setPayTypes(null);
        }
        return alipayConfigManager.updateById(alipayConfig).toDto();
    }

    /**
     * 获取
     */
    public AlipayConfigDto findById(Long id){
        return alipayConfigManager.findById(id)
                .map(AlipayConfig::toDto)
                .orElse(null);
    }

    /**
     * 分页
     */
    public PageResult<AlipayConfigDto> page(PageParam pageParam, AlipayConfigQuery param) {
        return MpUtils.convert2PageResult(alipayConfigManager.page(pageParam,param));
    }

    /**
     * 移到工具类中
     */
    public static void initApiConfig(AlipayConfig alipayConfig){
        // 支付宝支付配置注册
        AliPayApiConfig aliPayApiConfig = AliPayApiConfig.builder()
                .setAppId(alipayConfig.getAppId())
                .setPrivateKey(alipayConfig.getPrivateKey())
                .setCharset(CharsetUtil.UTF_8)
                .setAliPayPublicKey(alipayConfig.getAlipayPublicKey())
                .setServiceUrl(alipayConfig.getServerUrl())
                .setSignType(alipayConfig.getSignType())
                .build();
        AliPayApiConfigKit.setThreadLocalAliPayApiConfig(aliPayApiConfig);
    }
}
