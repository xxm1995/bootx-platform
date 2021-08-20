package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.user.service.UserInfoService;
import cn.bootx.iam.core.user.service.UserQueryService;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.param.user.UserInfoParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
* @author xxm
* @date 2020/4/25 20:02
*/
@Api(tags = "用户")
@RestController
@RequestMapping("/user")
@AllArgsConstructor
public class UserInfoController {
	private final UserInfoService userInfoService;
	private final UserQueryService userQueryService;

    @ApiOperation(value = "根据用户id查询用户")
    @GetMapping("/getById")
    public ResResult<UserInfoDto> getById(Long id) {
        return Res.ok(userInfoService.findById(id));
    }

    @ApiOperation(value = "根据邮箱查询用户")
    @GetMapping("/getByEmail")
    public ResResult<UserInfoDto> getByEmail(String email) {
        return Res.ok(userInfoService.findByEmail(email));
    }

    @ApiOperation(value = "根据手机号查询用户")
    @GetMapping("/getByPhone")
    public ResResult<UserInfoDto> getByPhone(String phone) {
        return Res.ok(userInfoService.findByPhone(phone));
    }

    @ApiOperation(value = "账号是否被使用")
    @GetMapping("/existsUsername")
    public ResResult<Boolean> existsUsername(String username) {
        return Res.ok(userInfoService.existsUsername(username));
    }
    @ApiOperation(value = "手机号是否被使用")
    @GetMapping("/existsPhone")
    public ResResult<Boolean> existsPhone(String phone) {
        return Res.ok(userInfoService.existsPhone(phone));
    }
    @ApiOperation(value = "邮箱是否被使用")
    @GetMapping("/existsEmail")
    public ResResult<Boolean> existsEmail(String email) {
        return Res.ok(userInfoService.existsEmail(email));
    }

    @ApiOperation("添加用户")
    @PostMapping("/add")
    public ResResult<UserInfoDto> add(@RequestBody UserInfoParam userInfoParam){
        return Res.ok(userInfoService.add(userInfoParam));
    }

    @ApiOperation("修改用户")
    @PostMapping("/update")
    public ResResult<UserInfoDto> update(@RequestBody UserInfoParam userInfoParam){
        return Res.ok(userInfoService.update(userInfoParam));
    }

    @ApiOperation("修改密码")
    @PostMapping("/updatePassword")
    public ResResult<Void> updatePassword(Long userId,
                                              @NotBlank(message = "旧密码不能为空") String password,
                                              @NotBlank(message = "新密码不能为空") String newPassword){
        userInfoService.updatePassword(userId,password,newPassword);
        return Res.ok();
    }

    @ApiOperation("重置密码")
    @PostMapping("/restartPassword")
    public ResResult<Void> restartPassword(Long userId,@NotBlank(message = "新密码不能为空") String newPassword){
        userInfoService.restartPassword(userId,newPassword);
        return Res.ok();
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<UserInfoDto>> page(PageParam pageParam,UserInfoParam userInfoParam){
        return Res.ok(userQueryService.page(pageParam,userInfoParam));
    }

}
