package cn.bootx.platform.iam.controller.third;

import cn.bootx.platform.core.annotation.IgnoreAuth;
import cn.bootx.platform.core.rest.Res;
import cn.bootx.platform.core.rest.param.PageParam;
import cn.bootx.platform.core.rest.result.PageResult;
import cn.bootx.platform.core.rest.result.Result;
import cn.bootx.platform.core.util.ValidationUtil;
import cn.bootx.platform.iam.bo.third.UserThirdBindInfo;
import cn.bootx.platform.iam.param.third.UserBindThirdParam;
import cn.bootx.platform.iam.result.third.UserThirdDto;
import cn.bootx.platform.iam.service.third.UserThirdBindService;
import cn.bootx.platform.iam.service.third.UserThirdQueryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * 用户三方登录管理
 *
 * @author xxm
 * @since 2021/8/4
 */
@Validated
@Tag(name = "用户三方登录管理")
@RestController
@RequestMapping("/user/third")
@AllArgsConstructor
public class UserThirdController {

    private final UserThirdBindService userThirdBindService;

    private final UserThirdQueryService userThirdQueryService;

    @Operation(summary = "分页")
    @GetMapping("/page")
    public Result<PageResult<UserThirdDto>> page(PageParam pageParam) {
        return Res.ok(userThirdQueryService.page(pageParam));
    }

    @Operation(summary = "获取详情")
    @PostMapping("/findById")
    public Result<UserThirdDto> findById(Long id) {
        return Res.ok(userThirdQueryService.findById(id));
    }

    @IgnoreAuth
    @Operation(summary = "获取绑定详情")
    @GetMapping("/getThirdBindInfo")
    public Result<UserThirdBindInfo> getThirdBindInfo() {
        return Res.ok(userThirdQueryService.getThirdBindInfo());
    }

    @IgnoreAuth
    @Operation(summary = "绑定第三方账号")
    @PostMapping("/bind")
    public Result<Void> bind(@RequestBody UserBindThirdParam param) {
        ValidationUtil.validateParam(param);
        userThirdBindService.bind(param.getAuthCode(), param.getLoginType(), param.getState());
        return Res.ok();
    }

    @IgnoreAuth
    @Operation(summary = "解绑第三方账号")
    @PostMapping("/unbind")
    public Result<Void> unbind(@NotBlank(message = "终端代码不可为空") String clientCode) {
        userThirdBindService.unbind(clientCode);
        return Res.ok();
    }

}
