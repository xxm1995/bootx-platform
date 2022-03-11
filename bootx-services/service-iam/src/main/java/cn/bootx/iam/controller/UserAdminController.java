package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.OperateLog;
import cn.bootx.common.core.enums.BusinessType;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.user.service.UserAdminService;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.dto.user.UserInfoWhole;
import cn.bootx.iam.param.user.UserInfoParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
* @author xxm
* @date 2021/9/6
*/
@Tag(name ="管理用户(管理员级别)")
@RestController
@RequestMapping("/user/admin")
@RequiredArgsConstructor
public class UserAdminController {

    private final UserAdminService userAdminService;

    @Operation( summary = "根据用户id查询用户")
    @GetMapping("/findById")
    public ResResult<UserInfoDto> findById(Long id) {
        return Res.ok(userAdminService.findById(id));
    }

    @Operation( summary = "查询用户详情")
    @GetMapping("/getUserInfoWhole")
    public ResResult<UserInfoWhole> getUserInfoWhole(Long id){
        return Res.ok(userAdminService.getUserInfoWhole(id));
    }

    @Operation( summary = "根据邮箱查询用户")
    @GetMapping("/getByEmail")
    public ResResult<UserInfoDto> getByEmail(String email) {
        return Res.ok(userAdminService.findByEmail(email));
    }

    @Operation( summary = "根据手机号查询用户")
    @GetMapping("/getByPhone")
    public ResResult<UserInfoDto> getByPhone(String phone) {
        return Res.ok(userAdminService.findByPhone(phone));
    }

    @Operation(summary = "添加用户")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody UserInfoParam userInfoParam){
        userAdminService.add(userInfoParam);
        return Res.ok();
    }

    @Operation(summary = "修改用户")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody UserInfoParam userInfoParam){
        userAdminService.update(userInfoParam);
        return Res.ok();
    }

    @Operation(summary = "重置密码")
    @OperateLog(title = "重置密码",businessType= BusinessType.UPDATE, saveParam = true)
    @PostMapping("/restartPassword")
    public ResResult<Void> restartPassword(Long userId,@NotBlank(message = "新密码不能为空") String newPassword){
        userAdminService.restartPassword(userId,newPassword);
        return Res.ok();
    }

    @Operation(summary = "锁定用户")
    @OperateLog(title = "锁定用户",businessType= BusinessType.UPDATE, saveParam = true)
    @PostMapping("/lock")
    public ResResult<Void> lock(Long userId){
        userAdminService.lock(userId);
        return Res.ok();
    }

    @Operation(summary = "解锁用户")
    @OperateLog(title = "解锁用户",businessType= BusinessType.UPDATE, saveParam = true)
    @PostMapping("/unlock")
    public ResResult<Void> unlock(Long userId){
        userAdminService.unlock(userId);
        return Res.ok();
    }

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<UserInfoDto>> page(PageParam pageParam, UserInfoParam userInfoParam){
        return Res.ok(userAdminService.page(pageParam,userInfoParam));
    }
}
