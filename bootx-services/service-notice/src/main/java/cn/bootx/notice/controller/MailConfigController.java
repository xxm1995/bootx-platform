package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.notice.core.mail.service.MailConfigService;
import cn.bootx.notice.dto.mail.MailConfigDto;
import cn.bootx.notice.param.mail.MailConfigParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/5/2 14:38
*/
@Api(tags = "邮箱配置")
@RestController
@RequestMapping("/mail/config")
@AllArgsConstructor
public class MailConfigController {
    private final MailConfigService mailConfigService;

    @ApiOperation(value = "获取所有邮箱配置")
    @GetMapping(value = "/findAll")
    public ResResult<List<MailConfigDto>> findAll() {
        List<MailConfigDto> all = mailConfigService.findAll();
        return Res.ok(all);
    }

    @ApiOperation(value = "通过 id 获取指定邮箱配置")
    @GetMapping("/findById")
    public ResResult<MailConfigDto> findById(Long id) {
        MailConfigDto mailConfig = mailConfigService.findById(id);
        return Res.ok(mailConfig);
    }

    @ApiOperation(value = "增加新邮箱配置")
    @PostMapping(value = "/add")
    public ResResult<MailConfigDto> add(@RequestBody MailConfigParam param) {
        ValidationUtil.validateParam(param);
        MailConfigDto mailConfig = mailConfigService.add(param);
        return Res.ok(mailConfig);
    }

    @ApiOperation(value = "更新邮箱配置")
    @PostMapping(value = "/update")
    public ResResult<MailConfigDto> updateMailConfig(@RequestBody MailConfigParam param) {
        ValidationUtil.validateParam(param);
        MailConfigDto update = mailConfigService.update(param);
        return Res.ok(update);
    }

    @ApiOperation("设置启用的邮箱配置")
    @PostMapping("/setUpActivity")
    public ResResult<Void> setUpActivity(Long id){
        mailConfigService.setUpActivity(id);
        return Res.ok();
    }

    @ApiOperation(value = "通过 id 删除邮箱配置")
    @DeleteMapping(value = "/delete")
    public ResResult<Boolean> deleteById(Long id) {
        mailConfigService.deleteById(id);
        return Res.ok(true);
    }
}
