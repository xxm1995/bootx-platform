package cn.bootx.starter.auth.endpoint;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.auth.service.TokenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
* 基础登录退出操作
* @author xxm  
* @date 2021/7/30 
*/
@Api(tags = "认证相关")
@RestController
@RequestMapping("/token")
@AllArgsConstructor
public class TokenEndpoint {
    private final TokenService tokenService;

    @ApiOperation("普通登录")
    @PostMapping("/login")
    public ResResult<String> login(HttpServletRequest request, HttpServletResponse response){
        return Res.ok(tokenService.loginPassword(request,response));
    }

    @ApiOperation("三方登录登录")
    @PostMapping("/loginOpenId")
    public ResResult<String> loginOpenId(HttpServletRequest request, HttpServletResponse response){
        return Res.ok(tokenService.loginOpenId(request,response));
    }

    @ApiOperation("退出")
    @PostMapping("/logout")
    public ResResult<String> logout(){
        tokenService.logout();
        return Res.ok();
    }

}
