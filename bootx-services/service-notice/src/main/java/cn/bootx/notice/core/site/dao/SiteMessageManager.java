package cn.bootx.notice.core.site.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.notice.core.site.entity.SiteMessage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
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

    public Integer countByReceive(Long userId, Boolean haveRead) {
        return lambdaQuery().eq(SiteMessage::getReceiveId,userId)
                .eq(Objects.nonNull(haveRead),SiteMessage::getHaveRead,haveRead)
                .count();
    }

    public Integer countBySender(Long userId, Boolean haveRead) {
        return lambdaQuery().eq(SiteMessage::getSenderId,userId)
                .eq(Objects.nonNull(haveRead),SiteMessage::getHaveRead,haveRead)
                .count();
    }

    public Page<SiteMessage> pageByReceive(PageParam pageParam, Long userId, Boolean haveRead) {
        Page<SiteMessage> mpPage = MpUtils.getMpPage(pageParam, SiteMessage.class);
        return lambdaQuery().eq(SiteMessage::getReceiveId,userId)
                .eq(Objects.nonNull(haveRead),SiteMessage::getHaveRead,haveRead)
                .page(mpPage);
    }

    public Page<SiteMessage> pageBySender(PageParam pageParam, Long userId, Boolean haveRead) {
        Page<SiteMessage> mpPage = MpUtils.getMpPage(pageParam, SiteMessage.class);
        return lambdaQuery().eq(SiteMessage::getSenderId,userId)
                .eq(Objects.nonNull(haveRead),SiteMessage::getHaveRead,haveRead)
                .page(mpPage);
    }

    public Page<SiteMessage> page(PageParam pageParam, Long userId) {
        Page<SiteMessage> mpPage = MpUtils.getMpPage(pageParam, SiteMessage.class);
        return lambdaQuery().eq(SiteMessage::getSenderId,userId)
                .page(mpPage);
    }

    public void readById(Long id) {
        lambdaUpdate().eq(MpBaseEntity::getId,id).set(SiteMessage::getHaveRead,Boolean.TRUE)
                .set(SiteMessage::getReadTime, LocalDateTime.now());
    }
}
