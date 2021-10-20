package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.notice.core.template.service.MessageTemplateService;
import cn.bootx.notice.dto.template.MessageTemplateDto;
import cn.bootx.notice.param.template.MessageTemplateParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 消息模板
 * @author xxm
 * @date 2021/8/10
 */
@Api(tags = "消息模板")
@RestController
@RequestMapping("/message/template")
@RequiredArgsConstructor
public class MessageTemplateController {
    private final MessageTemplateService messageTemplateService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<MessageTemplateDto> add(@RequestBody MessageTemplateParam param){
        return Res.ok(messageTemplateService.add(param));
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<MessageTemplateDto> update(@RequestBody MessageTemplateParam param){
        return Res.ok(messageTemplateService.update(param));
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<MessageTemplateDto>> page(PageParam pageParam){
        return Res.ok(messageTemplateService.page(pageParam));
    }

    @ApiOperation("获取详情")
    @GetMapping("/findById")
    public ResResult<MessageTemplateDto> findById(Long id){
        return Res.ok(messageTemplateService.findById(id));
    }

    @ApiOperation("删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        messageTemplateService.delete(id);
        return Res.ok();
    }

    @ApiOperation("编码是否被使用")
    @GetMapping("/existsByCode")
    public ResResult<Boolean> existsByCode(String code) {
        return Res.ok(messageTemplateService.existsByCode(code));
    }

    @ApiOperation("编码是否被使用(不包含自己)")
    @GetMapping("/existsByCodeNotId")
    public ResResult<Boolean> existsByCode(String code,Long id) {
        return Res.ok(messageTemplateService.existsByCode(code,id));
    }

    @ApiOperation("渲染模板")
    @GetMapping("/rendering")
    public ResResult<String> rendering(@RequestParam String code, @RequestBody Map<String,String> paramMap){
        return Res.ok(messageTemplateService.rendering(code,paramMap));
    }
}
