package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.user.service.UserExpandInfoService;
import cn.bootx.iam.core.user.service.UserInfoService;
import cn.bootx.iam.dto.user.LoginAfterUserInfo;
import cn.bootx.iam.dto.user.UserBaseInfoDto;
import cn.bootx.iam.param.user.UserBaseInfoParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
* @author xxm
* @date 2020/4/25 20:02
*/
@Tag(name ="用户管理")
@RestController
@RequestMapping("/user")
@AllArgsConstructor
public class UserInfoController {
	private final UserInfoService userInfoService;
	private final UserExpandInfoService userExpandInfoService;

    @Operation( summary = "账号是否被使用")
    @GetMapping("/existsUsername")
    public ResResult<Boolean> existsUsername(String username) {
        return Res.ok(userInfoService.existsUsername(username));
    }

    @Operation( summary = "账号是否被使用(不包含自己)")
    @GetMapping("/existsUsernameNotId")
    public ResResult<Boolean> existsUsername(String username,Long id) {
        return Res.ok(userInfoService.existsUsername(username,id));
    }

    @Operation( summary = "手机号是否被使用")
    @GetMapping("/existsPhone")
    public ResResult<Boolean> existsPhone(String phone) {
        return Res.ok(userInfoService.existsPhone(phone));
    }

    @Operation( summary = "手机号是否被使用(不包含自己)")
    @GetMapping("/existsPhoneNotId")
    public ResResult<Boolean> existsPhone(String phone,Long id) {
        return Res.ok(userInfoService.existsPhone(phone,id));
    }

    @Operation( summary = "邮箱是否被使用")
    @GetMapping("/existsEmail")
    public ResResult<Boolean> existsEmail(String email) {
        return Res.ok(userInfoService.existsEmail(email));
    }

    @Operation( summary = "邮箱是否被使用(不包含自己)")
    @GetMapping("/existsEmailNotId")
    public ResResult<Boolean> existsEmail(String email,Long id) {
        return Res.ok(userInfoService.existsEmail(email,id));
    }

    @Operation(summary = "修改密码")
    @PostMapping("/updatePassword")
    public ResResult<Void> updatePassword(@NotBlank(message = "旧密码不能为空") String password,
                                              @NotBlank(message = "新密码不能为空") String newPassword){
        userInfoService.updatePassword(password,newPassword);
        return Res.ok();
    }

    @Operation(summary = "查询用户基础信息")
    @GetMapping("/getUserBaseInfo")
    public ResResult<UserBaseInfoDto> getUserBaseInfo(){
        return Res.ok(userInfoService.getUserBaseInfo());
    }

    @Operation(summary = "修改用户基础信息")
    @PostMapping("/updateBaseInfo")
    public ResResult<Void> updateBaseInfo(@RequestBody UserBaseInfoParam param){
        userInfoService.updateUserBaseInfo(param);
        return Res.ok();
    }

    @IgnoreAuth
    @Operation(summary = "登录后获取用户信息")
    @GetMapping("/getLoginAfterUserInfo")
    public ResResult<LoginAfterUserInfo> getLoginAfterUserInfo(){
        return Res.ok(userInfoService.getLoginAfterUserInfo());
    }

}
