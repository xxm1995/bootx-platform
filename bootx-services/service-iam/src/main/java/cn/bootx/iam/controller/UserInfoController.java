package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.user.service.UserInfoService;
import cn.bootx.iam.dto.user.UserInfoDto;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @Parameter(name = "账号是否被使用")
    @GetMapping("/existsUsername")
    public ResResult<Boolean> existsUsername(String username) {
        return Res.ok(userInfoService.existsUsername(username));
    }

    @Parameter(name = "账号是否被使用(不包含自己)")
    @GetMapping("/existsUsernameNotId")
    public ResResult<Boolean> existsUsername(String username,Long id) {
        return Res.ok(userInfoService.existsUsername(username,id));
    }

    @Parameter(name = "手机号是否被使用")
    @GetMapping("/existsPhone")
    public ResResult<Boolean> existsPhone(String phone) {
        return Res.ok(userInfoService.existsPhone(phone));
    }

    @Parameter(name = "手机号是否被使用(不包含自己)")
    @GetMapping("/existsPhoneNotId")
    public ResResult<Boolean> existsPhone(String phone,Long id) {
        return Res.ok(userInfoService.existsPhone(phone,id));
    }

    @Parameter(name = "邮箱是否被使用")
    @GetMapping("/existsEmail")
    public ResResult<Boolean> existsEmail(String email) {
        return Res.ok(userInfoService.existsEmail(email));
    }

    @Parameter(name = "邮箱是否被使用(不包含自己)")
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

    @Operation(summary = "获取用户信息")
    @GetMapping("/getUserInfo")
    public ResResult<UserInfoDto> getUserInfo(){
        return Res.ok(userInfoService.getUserInfo());
    }


}
