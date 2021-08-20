package cn.bootx.payment.core.paymodel.wechat.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.payment.core.paymodel.wechat.dao.WeChatPayConfigManager;
import cn.bootx.payment.core.paymodel.wechat.entity.WeChatPayConfig;
import cn.bootx.payment.dto.paymodel.wechat.WeChatPayConfigDto;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollUtil;
import com.ijpay.wxpay.WxPayApiConfig;
import com.ijpay.wxpay.WxPayApiConfigKit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
* 微信支付配置
* @author xxm
* @date 2021/3/5
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatPayConfigService {
    private final WeChatPayConfigManager weChatPayConfigManager;

    /**
     * 添加微信支付配置
     */
    @Transactional(rollbackFor = Exception.class)
    public WeChatPayConfigDto add(WeChatPayConfigDto param){
        WeChatPayConfig weChatPayConfig = WeChatPayConfig.init(param);
        WeChatPayConfig save = weChatPayConfigManager.save(weChatPayConfig);
        return save.toDto();
    }

    /**
     * 修改
     */
    @Transactional(rollbackFor = Exception.class)
    public WeChatPayConfigDto update(WeChatPayConfigDto param){
        WeChatPayConfig weChatPayConfig = weChatPayConfigManager.findById(param.getId())
                .orElseThrow(() -> new BizException("微信支付配置不存在"));
        BeanUtil.copyProperties(param,weChatPayConfig, CopyOptions.create().ignoreNullValue());
        // 支付方式
        if (CollUtil.isNotEmpty(param.getPayTypeList())){
            weChatPayConfig.setPayTypes(String.join(",", param.getPayTypeList()));
        } else {
            weChatPayConfig.setPayTypes(null);
        }
        return weChatPayConfigManager.updateById(weChatPayConfig).toDto();
    }

    /**
     * 分页
     */
    public PageResult<WeChatPayConfigDto> page(PageParam pageParam){
        return MpUtils.convert2PageResult(weChatPayConfigManager.page(pageParam));
    }

    /**
     * 设置启用的支付宝配置
     */
    @Transactional(rollbackFor = Exception.class)
    public void setUpActivity(Long id){
        WeChatPayConfig weChatPayConfig = weChatPayConfigManager.findById(id).orElseThrow(() -> new BizException("微信支付配置不存在"));
        if (Objects.equals(weChatPayConfig.getActivity(),Boolean.TRUE)){
            return;
        }
        weChatPayConfigManager.removeAllActivity();
        weChatPayConfigManager.updateById(weChatPayConfig);
    }


    /**
     * 获取
     */
    public WeChatPayConfigDto findById(Long id){
        return weChatPayConfigManager.findById(id)
                .map(WeChatPayConfig::toDto)
                .orElse(null);
    }

    /**
     * 初始化
     */
    public static void initApiConfig(WeChatPayConfig weChatPayConfig) {
        WxPayApiConfig wxPayApiConfig = WxPayApiConfig.builder()
                .appId(weChatPayConfig.getAppId())
                .mchId(weChatPayConfig.getMchId())
                .apiKey(weChatPayConfig.getApiKey())
                .certPath(weChatPayConfig.getCertPath())
                .domain(weChatPayConfig.getDomain())
                .build();
        WxPayApiConfigKit.setThreadLocalWxPayApiConfig(wxPayApiConfig);
    }

}
