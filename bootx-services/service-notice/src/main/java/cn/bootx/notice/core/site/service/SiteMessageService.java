package cn.bootx.notice.core.site.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.notice.core.site.dao.SiteMessageManager;
import cn.bootx.notice.core.site.dao.SiteMessageUserManager;
import cn.bootx.notice.core.site.domain.SiteMessageInfo;
import cn.bootx.notice.core.site.entity.SiteMessage;
import cn.bootx.notice.core.site.entity.SiteMessageUser;
import cn.bootx.notice.dto.site.SiteMessageDto;
import cn.bootx.notice.param.site.SendSiteMessageParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.util.DesensitizedUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.notice.code.SiteMessageCode.RECEIVE_USER;
import static cn.bootx.notice.code.SiteMessageCode.STATE_CANCEL;

/**
 * 站内信
 * @author xxm
 * @date 2021/8/7
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SiteMessageService {
    private final SiteMessageManager siteMessageManager;
    private final SiteMessageUserManager siteMessageUserManager;

    /**
     * 站内信发送消息
     */
    @Transactional(rollbackFor = Exception.class)
    public void send(SendSiteMessageParam param){
        val userDetail = SecurityUtil.getCurrentUser();

        // 新增站内信内容
        SiteMessage siteMessage = new SiteMessage()
                .setTitle(param.getTitle())
                .setContent(param.getContent())
                .setSenderId(userDetail.map(UserDetail::getId).orElse(DesensitizedUtil.userId()))
                .setSenderName(userDetail.map(UserDetail::getName).orElse("未知"))
                .setSenderTime(LocalDateTime.now());
        siteMessageManager.save(siteMessage);
        // 添加消息关联人信息
        if (Objects.equals(RECEIVE_USER,param.getReceiveType())){
            List<SiteMessageUser> siteMessageUsers = param.getReceiveIds().stream()
                    .map(userId -> new SiteMessageUser()
                            .setMessageId(siteMessage.getId())
                            .setReceiveId(userId))
                    .collect(Collectors.toList());
            siteMessageUserManager.saveAll(siteMessageUsers);
        }

    }

    /**
     * 撤回消息
     */
    @Transactional(rollbackFor = Exception.class)
    public void cancel(Long messageId){
        SiteMessage siteMessage = siteMessageManager.findById(messageId).orElseThrow(() -> new DataNotExistException("站内信不存在"));
        siteMessage.setCancelTime(LocalDateTime.now())
                .setSendState(STATE_CANCEL);
        siteMessageManager.updateById(siteMessage);
    }

    /**
     * 删除消息
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long messageId){
        SiteMessage siteMessage = siteMessageManager.findById(messageId).orElseThrow(() -> new DataNotExistException("站内信不存在"));
        if (!Objects.equals(siteMessage.getSendState(),STATE_CANCEL)){
            throw new BizException("站内信不是撤销状态，无法被删除");
        }
        siteMessageManager.deleteById(messageId);
        siteMessageUserManager.deleteByMessageId(messageId);
    }

    /**
     * 未读消息数量
     */
    public Integer countByReceiveNotRead(SiteMessageInfo query){
        Long userId = SecurityUtil.getUserId();
//        Long userId = 0L;
        return siteMessageManager.countByReceiveNotRead(userId);
    }

    /**
     * 接收消息分页
     */
    public PageResult<SiteMessageInfo> pageByReceive(PageParam pageParam,SiteMessageInfo query){
        Long userId = SecurityUtil.getUserId();
//        Long userId = 0L;
        return MpUtil.convert2PageResult(siteMessageManager.pageByReceive(pageParam,query,userId));
    }
    /**
     * 发送消息分页
     */
    public PageResult<SiteMessageDto> pageBySender(PageParam pageParam,SiteMessageInfo query){
        Long userId = SecurityUtil.getUserId();
//        Long userId = 0L;
        return MpUtil.convert2DtoPageResult(siteMessageManager.pageBySender(pageParam,query,userId));
    }

    /**
     * 查询详情
     */
    public SiteMessageDto findById(Long id){
        return siteMessageManager.findById(id).map(SiteMessage::toDto)
                .orElseThrow(DataNotExistException::new);
    }

    /**
     * 阅读
     */
    public void read(Long messageId){
        Long userId = SecurityUtil.getUserId();
//        Long userId = 0L;
        SiteMessageUser siteMessageUser = siteMessageUserManager.findByMessageId(messageId)
                .orElse(new SiteMessageUser()
                        .setReceiveId(userId)
                        .setMessageId(messageId)
                );
        siteMessageUser.setHaveRead(true)
                .setReadTime(LocalDateTime.now());
        siteMessageUserManager.saveOrUpdate(siteMessageUser);
    }
}
