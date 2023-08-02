package cn.bootx.platform.miniapp.core.protocol.dao;

import cn.bootx.platform.miniapp.param.protocol.UserProtocolParam;
import cn.bootx.platform.miniapp.core.protocol.entity.UserProtocol;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.common.query.generator.QueryGenerator;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@Repository
@RequiredArgsConstructor
public class UserProtocolManager extends BaseManager<UserProtocolMapper, UserProtocol> {

    /**
    * 分页
    */
    public Page<UserProtocol> page(PageParam pageParam, UserProtocolParam param) {
        Page<UserProtocol> mpPage = MpUtil.getMpPage(pageParam, UserProtocol.class);
        QueryWrapper<UserProtocol> wrapper = QueryGenerator.generator(param, this.getEntityClass());
        wrapper.select(this.getEntityClass(),MpUtil::excludeBigField)
                .orderByDesc(MpUtil.getColumnName(UserProtocol::getId));
        return this.page(mpPage,wrapper);
    }
}
