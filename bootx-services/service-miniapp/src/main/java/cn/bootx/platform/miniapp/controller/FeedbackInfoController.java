package cn.bootx.platform.miniapp.controller;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.miniapp.core.feedback.service.FeedbackInfoService;
import cn.bootx.platform.miniapp.dto.feedback.FeedbackInfoDto;
import cn.bootx.platform.miniapp.param.feedback.FeedbackInfoParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@Tag(name ="用户反馈信息")
@RestController
@RequestMapping("/feedback")
@RequiredArgsConstructor
public class FeedbackInfoController {
    private final FeedbackInfoService feedbackInfoService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@Validated  @RequestBody FeedbackInfoParam param, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            throw new BizException("参数绑定异常");
        }
        feedbackInfoService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody FeedbackInfoParam param){
        feedbackInfoService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        feedbackInfoService.delete(id);
        return Res.ok();
    }

    @Operation(summary = "批量删除")
    @DeleteMapping("/deleteBatch")
    public ResResult<Void> deleteBatch(@RequestBody List<Long> ids) {
        feedbackInfoService.deleteBatch(ids);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<FeedbackInfoDto> findById(Long id){
        return Res.ok(feedbackInfoService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<FeedbackInfoDto>> findAll(){
        return Res.ok(feedbackInfoService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<FeedbackInfoDto>> page(PageParam pageParam, FeedbackInfoParam query){
        return Res.ok(feedbackInfoService.page(pageParam,query));
    }
}
