package cn.bootx.starter.dingtalk.core.config.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.dingtalk.core.config.entity.DingTalkConfig;
import cn.bootx.starter.dingtalk.param.config.DingTalkConfigParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**   
* 钉钉配置
* @author xxm  
* @date 2022/4/2 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class DingTalkConfigManager extends BaseManager<DingTalkConfigMapper, DingTalkConfig> {


    /**
     * 分页
     */
    public Page<DingTalkConfig> page(PageParam pageParam, DingTalkConfigParam param) {
        Page<DingTalkConfig> mpPage = MpUtil.getMpPage(pageParam, DingTalkConfig.class);
        return lambdaQuery()
                .like(StrUtil.isNotBlank(param.getName()),DingTalkConfig::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getAppKey()),DingTalkConfig::getAppKey,param.getAppKey())
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }

    /**
     * 清除所有启用状态
     */
    public void removeAllEnable() {
        lambdaUpdate().eq(DingTalkConfig::getEnable,Boolean.TRUE)
                .set(DingTalkConfig::getEnable,Boolean.FALSE)
                .update();
    }

    /**
     * 获取启用的
     */
    public Optional<DingTalkConfig> findByEnable(){
        return lambdaQuery().eq(DingTalkConfig::getEnable,Boolean.TRUE)
                .oneOpt();
    }
}
