package cn.bootx.payment.core.paymodel.wechat.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.payment.core.paymodel.wechat.entity.WeChatPayConfig;
import cn.bootx.payment.param.paymodel.wechat.WeChatPayConfigParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Objects;
import java.util.Optional;

/**   
* 微信支付配置
* @author xxm  
* @date 2021/3/19 
*/
@Repository
@RequiredArgsConstructor
public class WeChatPayConfigManager extends BaseManager<WeChatPayConfigMapper, WeChatPayConfig> {
    private Optional<WeChatPayConfig> weChatPayConfig;

    /**
     * 获取启用的微信配置
     */
    public Optional<WeChatPayConfig> findActivity(){
        if (Objects.isNull(weChatPayConfig)){
            weChatPayConfig = findByField(WeChatPayConfig::getActivity, Boolean.TRUE);
        }
        return weChatPayConfig;
    }

    /**
     * 分页
     */
    public Page<WeChatPayConfig> page(PageParam pageParam, WeChatPayConfigParam param) {
        Page<WeChatPayConfig> mpPage = MpUtil.getMpPage(pageParam, WeChatPayConfig.class);
        return lambdaQuery()
                .select(WeChatPayConfig.class, MpUtil::excludeBigField)
                .like(StrUtil.isNotBlank(param.getName()), WeChatPayConfig::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getAppId()),WeChatPayConfig::getAppId,param.getAppId())
                .like(StrUtil.isNotBlank(param.getAppId()),WeChatPayConfig::getMchId,param.getMchId())
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }

    /**
     * 清除所有的被启用的
     */
    public void removeAllActivity() {
        this.clearCache();
        lambdaUpdate().eq(WeChatPayConfig::getActivity,Boolean.TRUE)
                .set(WeChatPayConfig::getActivity,Boolean.FALSE);
    }

    /**
     * 清除缓存
     */
    public void clearCache(){
        weChatPayConfig = null;
    }
}
