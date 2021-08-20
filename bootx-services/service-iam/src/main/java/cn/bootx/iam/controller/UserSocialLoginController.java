package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.user.service.UserSocialLoginService;
import cn.bootx.iam.dto.user.UserSocialLoginDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* 用户三方登录管理
* @author xxm
* @date 2021/8/4
*/
@Api(tags = "用户三方登录管理")
@RestController
@RequestMapping("/user/social")
@AllArgsConstructor
public class UserSocialLoginController {
    private final UserSocialLoginService userSocialLoginService;
    
    @ApiOperation("分页")
    @PostMapping("/page")
    public ResResult<PageResult<UserSocialLoginDto>> page(PageParam pageParam){
        return Res.ok(userSocialLoginService.page(pageParam));
    }


}
