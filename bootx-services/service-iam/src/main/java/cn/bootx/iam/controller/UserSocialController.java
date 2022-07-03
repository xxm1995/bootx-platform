package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.iam.core.social.service.UserSocialBindService;
import cn.bootx.iam.core.social.service.UserSocialQueryService;
import cn.bootx.iam.dto.user.UserSocialBindInfo;
import cn.bootx.iam.dto.user.UserSocialDto;
import cn.bootx.iam.param.user.UserBindSocialParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
* 用户三方登录管理
* @author xxm
* @date 2021/8/4
*/
@Validated
@Tag(name ="用户三方登录管理")
@RestController
@RequestMapping("/user/social")
@AllArgsConstructor
public class UserSocialController {
    private final UserSocialBindService userSocialBindService;
    private final UserSocialQueryService userSocialQueryService;

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<UserSocialDto>> page(PageParam pageParam){
        return Res.ok(userSocialQueryService.page(pageParam));
    }
    
    @Operation(summary = "获取详情")
    @PostMapping("/findById")
    public ResResult<UserSocialDto> findById(Long id){
        return Res.ok(userSocialQueryService.findById(id));
    }

    @IgnoreAuth
    @Operation(summary = "获取绑定详情")
    @GetMapping("/getSocialBindInfo")
    public ResResult<UserSocialBindInfo> getSocialBindInfo(){
        return Res.ok(userSocialQueryService.getSocialBindInfo());
    }

    @IgnoreAuth
    @Operation(summary = "绑定第三方账号")
    @PostMapping("/bind")
    public ResResult<Void> bind(@RequestBody UserBindSocialParam param){
        ValidationUtil.validateParam(param);
        userSocialBindService.bind(param.getAuthCode(),param.getClientCode(),param.getState());
        return Res.ok();
    }

    @IgnoreAuth
    @Operation(summary = "解绑第三方账号")
    @PostMapping("/unbind")
    public ResResult<Void> unbind(@NotBlank(message = "终端代码不可为空") String clientCode){
        userSocialBindService.unbind(clientCode);
        return Res.ok();
    }


}
