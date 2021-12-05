package cn.bootx.notice.core.site.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.notice.core.site.dao.SiteMessageManager;
import cn.bootx.notice.core.site.entity.SiteMessage;
import cn.bootx.notice.dto.site.SiteMessageDto;
import cn.bootx.notice.param.site.SendSiteMessageParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

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

    /**
     * 发送消息
     */
    @Transactional(rollbackFor = Exception.class)
    public void send(SendSiteMessageParam param){
        UserDetail userDetail = SecurityUtil.getUser();
        List<SiteMessage> siteMessages = param.getReceiveIds().stream()
                .map(user -> new SiteMessage().setTitle(param.getTitle())
                        .setContent(param.getContent())
                        .setSenderId(userDetail.getId())
                        .setSenderName(userDetail.getName())
                        .setSenderTime(LocalDateTime.now())
                        .setReceiveId(user.getReceiveId())
                        .setReceiveName(user.getReceiveName())
                        .setHaveRead(Boolean.FALSE)
                ).collect(Collectors.toList());
        siteMessageManager.saveAll(siteMessages);
    }

    /**
     * 获取接收消息条数
     */
    public Integer getReceiveCount(Boolean haveRead){
        Long userId = SecurityUtil.getUserId();
        return siteMessageManager.countByReceive(userId,haveRead);
    }


    /**
     * 获取发送消息条数
     */
    public Integer getSenderCount(Boolean haveRead){
        Long userId = SecurityUtil.getUserId();
        return siteMessageManager.countBySender(userId,haveRead);
    }

    /**
     * 接收消息分页
     */
    public PageResult<SiteMessageDto> pageByReceive(PageParam pageParam,Boolean haveRead){
        Long userId = SecurityUtil.getUserId();
        return MpUtil.convert2PageResult(siteMessageManager.pageByReceive(pageParam,userId,haveRead));
    }
    /**
     * 发送消息分页
     */
    public PageResult<SiteMessageDto> pageBySender(PageParam pageParam,Boolean haveRead){
        Long userId = SecurityUtil.getUserId();
        return MpUtil.convert2PageResult(siteMessageManager.pageBySender(pageParam,userId,haveRead));
    }

    /**
     * 消息分页
     */
    public PageResult<SiteMessageDto> page(PageParam pageParam){
        Long userId = SecurityUtil.getUserId();
        return MpUtil.convert2PageResult(siteMessageManager.page(pageParam,userId));

    }

    /**
     * 查询详情
     */
    public SiteMessageDto findById(Long id){
        return siteMessageManager.findById(id).map(SiteMessage::toDto)
                .orElse(null);
    }

    /**
     * 阅读
     */
    public void read(Long id){
        siteMessageManager.readById(id);
    }
}
