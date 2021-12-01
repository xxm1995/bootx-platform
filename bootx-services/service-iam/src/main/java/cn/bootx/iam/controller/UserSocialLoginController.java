package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.social.service.UserSocialLoginService;
import cn.bootx.iam.dto.user.UserSocialLoginDto;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* 用户三方登录管理
* @author xxm
* @date 2021/8/4
*/
@Tag(name ="用户三方登录管理")
@RestController
@RequestMapping("/user/social")
@AllArgsConstructor
public class UserSocialLoginController {
    private final UserSocialLoginService userSocialLoginService;
    
    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<UserSocialLoginDto>> page(PageParam pageParam){
        return Res.ok(userSocialLoginService.page(pageParam));
    }
    
    @Operation(summary = "获取详情")
    @PostMapping("/findById")
    public ResResult<UserSocialLoginDto> findById(Long id){
        return Res.ok(userSocialLoginService.findById(id));
    }


}
