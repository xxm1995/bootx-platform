package cn.bootx.notice.core.dingtalk.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.notice.core.dingtalk.entity.DingRobotConfig;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
* 钉钉机器人
* @author xxm
* @date 2020/11/29
*/
@Repository
@RequiredArgsConstructor
public class DingRobotConfigManage extends BaseManager<DingRobotConfigMapper, DingRobotConfig> {

    public Optional<DingRobotConfig> findByCode(String code) {
        return findByField(DingRobotConfig::getCode,code);
    }

    public boolean existsByCode(String code) {
        return existedByField(DingRobotConfig::getCode,code);
    }

    public boolean existsByCode(String code,Long id) {
        return lambdaQuery().eq(DingRobotConfig::getCode, code)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public Page<DingRobotConfig> page(PageParam pageParam) {
        Page<DingRobotConfig> mpPage = MpUtil.getMpPage(pageParam, DingRobotConfig.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getCreateTime)
                .page(mpPage);
    }
}
