package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.notice.core.site.service.SiteMessageService;
import cn.bootx.notice.dto.site.SiteMessageDto;
import cn.bootx.notice.param.site.SendSiteMessageParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**   
*
* @author xxm  
* @date 2021/8/8 
*/
@Api(tags = "站内信")
@RestController
@RequestMapping("/site/message")
@RequiredArgsConstructor
public class SiteMessageController {
    private final SiteMessageService siteMessageService;
    
    @ApiOperation("发送站内信")
    @PostMapping("/send")
    public ResResult<Void> send(@RequestBody SendSiteMessageParam param){
        siteMessageService.send(param);
        return Res.ok();
    }

    @ApiOperation("消息详情")
    @GetMapping("/findById")
    public ResResult<SiteMessageDto> findById(Long id){
        return Res.ok(siteMessageService.findById(id));
    }

    @ApiOperation("获取接收消息条数")
    @GetMapping("/getReceiveCount")
    public ResResult<Integer> getReceiveCount(Boolean haveRead){
        return Res.ok(siteMessageService.getReceiveCount(haveRead));
    }


    @ApiOperation("获取发送消息条数")
    @GetMapping("/getSenderCount")
    public ResResult<Integer> getSenderCount(Boolean haveRead){
        return Res.ok(siteMessageService.getSenderCount(haveRead));
    }

    @ApiOperation("接收消息分页")
    @GetMapping("/pageByReceive")
    public ResResult<PageResult<SiteMessageDto>> pageByReceive(PageParam pageParam, Boolean haveRead){
        return Res.ok(siteMessageService.pageByReceive(pageParam,haveRead));
    }

    @ApiOperation("发送消息分页")
    @GetMapping("/pageBySender")
    public ResResult<PageResult<SiteMessageDto>> pageBySender(PageParam pageParam, Boolean haveRead){
        return Res.ok(siteMessageService.pageBySender(pageParam,haveRead));
    }

    @ApiOperation("消息分页")
    @GetMapping("/page")
    public ResResult<PageResult<SiteMessageDto>> page(PageParam pageParam){
        return Res.ok(siteMessageService.page(pageParam));
    }

    @ApiOperation("标为已读")
    @PostMapping("/read")
    public ResResult<Void> read(Long id){
        siteMessageService.read(id);
        return Res.ok();
    }
}
