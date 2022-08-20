package cn.bootx.notice.core.site.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.notice.code.SiteMessageCode;
import cn.bootx.notice.core.site.domain.SiteMessageInfo;
import cn.bootx.notice.core.site.entity.SiteMessage;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Repository;

import java.util.Objects;

/**
 * 站内信
 * @author xxm
 * @date 2021/8/7
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class SiteMessageManager extends BaseManager<SiteMessageMapper, SiteMessage> {

    /**
     * 接收用户消息分页
     */
    public Page<SiteMessageInfo> pageByReceive(PageParam pageParam, SiteMessageInfo query, Long userId){
        val mpPage = MpUtil.getMpPage(pageParam, SiteMessageInfo.class);

        val wrapper = new LambdaQueryWrapper<SiteMessageInfo>()
                .and(o->o.eq(SiteMessageInfo::getReceiveType, SiteMessageCode.RECEIVE_ALL)
                        .or()
                        .eq(SiteMessageInfo::getReceiveId,userId))
                .eq(Objects.nonNull(query.getHaveRead()),SiteMessageInfo::getHaveRead,query.getHaveRead())
                .eq(Objects.nonNull(query.getTitle()),SiteMessageInfo::getTitle,query.getTitle())
                .orderByAsc(SiteMessageInfo::getHaveRead)
                .orderByDesc(SiteMessageInfo::getReadTime);
        return baseMapper.pageMassage(mpPage,wrapper);
    }

    /**
     * 查询未读的消息数量
     */
    public Integer countByReceiveNotRead(Long userId){
        val wrapper = new LambdaQueryWrapper<SiteMessageInfo>()
                .and(o->o.eq(SiteMessageInfo::getReceiveType, SiteMessageCode.RECEIVE_ALL)
                        .or()
                        .eq(SiteMessageInfo::getReceiveId,userId))
                .eq(SiteMessageInfo::getHaveRead,false)
                .orderByAsc(SiteMessageInfo::getHaveRead)
                .orderByDesc(SiteMessageInfo::getReadTime);
        return baseMapper.countMassage(wrapper);
    }

    /**
     * 接收人消息分页
     */
    public Page<SiteMessage> pageBySender(PageParam pageParam, SiteMessageInfo query, Long userId) {
        Page<SiteMessage> mpPage = MpUtil.getMpPage(pageParam, SiteMessage.class);
        return lambdaQuery()
                .select(SiteMessage.class, MpUtil::excludeBigField)
                .eq(SiteMessage::getSenderId,userId)
                .like(StrUtil.isNotBlank(query.getTitle()),SiteMessage::getSenderId,query.getTitle())
                .eq(StrUtil.isNotBlank(query.getSendState()),SiteMessage::getSendState,query.getSendState())
                .eq(StrUtil.isNotBlank(query.getReceiveType()),SiteMessage::getReceiveType,query.getReceiveType())
                .page(mpPage);
    }
}
