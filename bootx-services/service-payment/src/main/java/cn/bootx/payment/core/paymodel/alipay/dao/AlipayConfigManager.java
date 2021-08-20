package cn.bootx.payment.core.paymodel.alipay.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.paymodel.alipay.entity.AlipayConfig;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
* 支付宝配置
* @author xxm
* @date 2021/2/26
*/
@Repository
@RequiredArgsConstructor
public class AlipayConfigManager extends BaseManager<AlipayConfigMapper,AlipayConfig> {

    /**
     * 获取启用的支付宝配置
     */
    public Optional<AlipayConfig> findActivity(){
        return findByField(AlipayConfig::getActivity,Boolean.TRUE);
    }

    public Page<AlipayConfig> page(PageParam pageParam, AlipayConfigQuery param) {
        Page<AlipayConfig> mpPage = MpUtils.getMpPage(pageParam, AlipayConfig.class);
        return lambdaQuery()
                .page(mpPage);
    }

    public void removeAllActivity() {
        lambdaUpdate().eq(AlipayConfig::getActivity,Boolean.TRUE)
                .set(AlipayConfig::getActivity,Boolean.FALSE);

    }
}
