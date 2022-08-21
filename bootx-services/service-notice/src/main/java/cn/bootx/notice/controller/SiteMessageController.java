package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.notice.core.site.domain.SiteMessageInfo;
import cn.bootx.notice.core.site.service.SiteMessageService;
import cn.bootx.notice.dto.site.SiteMessageDto;
import cn.bootx.notice.param.site.SendSiteMessageParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author xxm
 * @date 2021/8/8
 */
@Tag(name ="站内信")
@RestController
@RequestMapping("/site/message")
@RequiredArgsConstructor
public class SiteMessageController {
    private final SiteMessageService siteMessageService;

    @Operation(summary = "保存站内信草稿")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody SendSiteMessageParam param){
        siteMessageService.add(param);
        return Res.ok();
    }
    @Operation(summary = "发送站内信")
    @PostMapping("/send")
    public ResResult<Void> send(Long id){
        siteMessageService.send(id);
        return Res.ok();
    }

    @Operation(summary = "消息详情")
    @GetMapping("/findById")
    public ResResult<SiteMessageDto> findById(Long id){
        return Res.ok(siteMessageService.findById(id));
    }

    @Operation(summary = "获取未读的接收消息条数")
    @GetMapping("/countByReceiveNotRead")
    public ResResult<Integer> countByReceiveNotRead(SiteMessageInfo query){
        return Res.ok(siteMessageService.countByReceiveNotRead(query));
    }

    @Operation(summary = "接收消息分页")
    @GetMapping("/pageByReceive")
    public ResResult<PageResult<SiteMessageInfo>> pageByReceive(PageParam pageParam,SiteMessageInfo query){
        return Res.ok(siteMessageService.pageByReceive(pageParam,query));
    }

    @Operation(summary = "发送消息分页")
    @GetMapping("/pageBySender")
    public ResResult<PageResult<SiteMessageDto>> pageBySender(PageParam pageParam, SiteMessageInfo query){
        return Res.ok(siteMessageService.pageBySender(pageParam,query));
    }

    @Operation(summary = "撤回消息")
    @PostMapping("/cancel")
    public ResResult<Void> cancel(Long id){
        siteMessageService.cancel(id);
        return Res.ok();
    }

    @Operation(summary = "撤回消息")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        siteMessageService.delete(id);
        return Res.ok();
    }

    @Operation(summary = "标为已读")
    @PostMapping("/read")
    public ResResult<Void> read(Long id){
        siteMessageService.read(id);
        return Res.ok();
    }
}
