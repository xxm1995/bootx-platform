package cn.bootx.starter.dingtalk.core.config.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.dingtalk.core.config.entity.DingTalkConfig;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
* 钉钉配置
* @author xxm  
* @date 2022/4/2 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class DingTalkConfigManager extends BaseManager<DingTalkConfigMapper, DingTalkConfig> {

    public Page<DingTalkConfig> page(PageParam pageParam) {
        Page<DingTalkConfig> mpPage = MpUtil.getMpPage(pageParam, DingTalkConfig.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }

    public void removeAllEnable() {
        lambdaUpdate().eq(DingTalkConfig::getEnable,Boolean.TRUE)
                .set(DingTalkConfig::getEnable,Boolean.FALSE)
                .update();
    }
}
