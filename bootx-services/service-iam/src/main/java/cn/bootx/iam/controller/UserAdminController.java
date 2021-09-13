package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.Log;
import cn.bootx.common.core.enums.BusinessType;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.user.service.UserAdminService;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.param.user.UserInfoParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
* @author xxm
* @date 2021/9/6
*/
@Api(tags = "管理用户(管理员级别)")
@RestController
@RequestMapping("/user/admin")
@RequiredArgsConstructor
public class UserAdminController {

    private final UserAdminService userAdminService;

    @ApiOperation(value = "根据用户id查询用户")
    @GetMapping("/findById")
    public ResResult<UserInfoDto> findById(Long id) {
        return Res.ok(userAdminService.findById(id));
    }

    @ApiOperation(value = "查询用户详情")
    @GetMapping("/getUserInfo")
    public ResResult<UserInfoDto> getUserInfo(Long id){
        return Res.ok(userAdminService.getUserInfo(id));
    }

    @ApiOperation(value = "根据邮箱查询用户")
    @GetMapping("/getByEmail")
    public ResResult<UserInfoDto> getByEmail(String email) {
        return Res.ok(userAdminService.findByEmail(email));
    }

    @ApiOperation(value = "根据手机号查询用户")
    @GetMapping("/getByPhone")
    public ResResult<UserInfoDto> getByPhone(String phone) {
        return Res.ok(userAdminService.findByPhone(phone));
    }

    @ApiOperation("添加用户")
    @PostMapping("/add")
    public ResResult<UserInfoDto> add(@RequestBody UserInfoParam userInfoParam){
        return Res.ok(userAdminService.add(userInfoParam));
    }

    @ApiOperation("修改用户")
    @PostMapping("/update")
    public ResResult<UserInfoDto> update(@RequestBody UserInfoParam userInfoParam){
        return Res.ok(userAdminService.update(userInfoParam));
    }

    @ApiOperation("重置密码")
    @Log(title = "重置密码",businessType= BusinessType.UPDATE,isParam = true)
    @PostMapping("/restartPassword")
    public ResResult<Void> restartPassword(Long userId,@NotBlank(message = "新密码不能为空") String newPassword){
        userAdminService.restartPassword(userId,newPassword);
        return Res.ok();
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<UserInfoDto>> page(PageParam pageParam, UserInfoParam userInfoParam){
        return Res.ok(userAdminService.page(pageParam,userInfoParam));
    }
}
