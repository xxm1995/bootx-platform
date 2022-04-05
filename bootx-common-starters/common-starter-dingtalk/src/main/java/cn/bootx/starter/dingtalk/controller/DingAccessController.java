package cn.bootx.starter.dingtalk.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.dingtalk.core.access.service.DingAccessService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*
* @author xxm
* @date 2022/4/5
*/
@Tag(name = "钉钉Access")
@RestController
@RequestMapping("/ding/access")
@RequiredArgsConstructor
public class DingAccessController {
    private final DingAccessService dingAccessService;

    @Operation(summary = "生成第三方登录网址")
    @GetMapping("/genThirdLoginUrl")
    public ResResult<String> genThirdLoginUrl(String redirectUri){
        return Res.ok(dingAccessService.genThirdLoginUrl(redirectUri));
    }
}
