package cn.bootx.payment.core.paymodel.alipay.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.dto.KeyValue;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.payment.code.paymodel.AliPayCode;
import cn.bootx.payment.code.paymodel.AliPayWay;
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
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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
        alipayConfig.setActivity(false)
                .setState(1);
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
        mailConfig.setActivity(true);
        alipayConfigManager.updateById(mailConfig);
    }

    /**
     * 清除启用状态
     */
    public void clearActivity(Long id){
        AlipayConfig mailConfig = alipayConfigManager.findById(id).orElseThrow(() -> new BizException("支付宝配置不存在"));
        if (Objects.equals(mailConfig.getActivity(),Boolean.FALSE)){
            return;
        }
        mailConfig.setActivity(false);
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
                .orElseThrow(DataNotExistException::new);
    }

    /**
     * 分页
     */
    public PageResult<AlipayConfigDto> page(PageParam pageParam, AlipayConfigQuery param) {
        return MpUtil.convert2PageResult(alipayConfigManager.page(pageParam,param));
    }

    /**
     * 支付宝支持支付方式
     */
    public List<KeyValue> findPayTypeList() {
        return AliPayWay.getPayWays().stream()
                .map(e->new KeyValue(e.getCode(),e.getName()))
                .collect(Collectors.toList());
    }

    /**
     * 移到工具类中
     */
    @SneakyThrows
    public static void initApiConfig(AlipayConfig alipayConfig){

        AliPayApiConfig aliPayApiConfig;
        // 公钥
        if (Objects.equals(alipayConfig.getAuthType(), AliPayCode.AUTH_TYPE_KEY)){
            aliPayApiConfig = AliPayApiConfig.builder()
                    .setAppId(alipayConfig.getAppId())
                    .setPrivateKey(alipayConfig.getPrivateKey())
                    .setAliPayPublicKey(alipayConfig.getAlipayPublicKey())
                    .setCharset(CharsetUtil.UTF_8)
                    .setServiceUrl(alipayConfig.getServerUrl())
                    .setSignType(alipayConfig.getSignType())
                    .build();
        }
        // 证书
        else if (Objects.equals(alipayConfig.getAuthType(), AliPayCode.AUTH_TYPE_CART)){
            aliPayApiConfig = AliPayApiConfig.builder()
                    .setAppId(alipayConfig.getAppId())
                    .setPrivateKey(alipayConfig.getPrivateKey())
                    .setAppCertContent(alipayConfig.getAppCert())
                    .setAliPayCertContent(alipayConfig.getAlipayCert())
                    .setAliPayRootCertContent(alipayConfig.getAlipayRootCert())
                    .setCharset(CharsetUtil.UTF_8)
                    .setServiceUrl(alipayConfig.getServerUrl())
                    .setSignType(alipayConfig.getSignType())
                    .buildByCertContent();
        } else {
            throw new BizException("支付宝认证方式不可为空");
        }

        AliPayApiConfigKit.setThreadLocalAliPayApiConfig(aliPayApiConfig);
    }
}
