package cn.bootx.starter.wecom.core.robot.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.wecom.core.robot.entity.WecomRobotConfig;
import cn.bootx.starter.wecom.param.robot.WecomRobotConfigParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * 企业微信机器人配置
 * @author bootx
 * @date 2022-07-23
 */
@Repository
@RequiredArgsConstructor
public class WecomRobotConfigManager extends BaseManager<WecomRobotConfigMapper, WecomRobotConfig> {

    /**
     * 根据code获取机器人配置
     */
    public Optional<WecomRobotConfig> findByCode(String code){
        return findByField(WecomRobotConfig::getCode,code);
    }

    /**
    * 分页
    */
    public Page<WecomRobotConfig> page(PageParam pageParam, WecomRobotConfigParam param) {
        Page<WecomRobotConfig> mpPage = MpUtil.getMpPage(pageParam, WecomRobotConfig.class);
        return lambdaQuery().orderByDesc(MpIdEntity::getId).page(mpPage);
    }
}