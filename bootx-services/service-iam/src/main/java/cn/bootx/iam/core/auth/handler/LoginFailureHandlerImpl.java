package cn.bootx.iam.core.auth.handler;

import cn.bootx.common.core.code.WebHeaderCode;
import cn.bootx.starter.audit.log.param.LoginLogParam;
import cn.bootx.starter.audit.log.service.LoginLogService;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.handler.LoginFailureHandler;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

/**
* 登录失败
* @author xxm
* @date 2021/8/13
*/
@Component
@RequiredArgsConstructor
public class LoginFailureHandlerImpl implements LoginFailureHandler {
    private final LoginLogService loginLogService;

    @Override
    public void onLoginFailure(HttpServletRequest request, HttpServletResponse response, LoginFailureException e) {

        UserAgent userAgent = UserAgentUtil.parse(request.getHeader(WebHeaderCode.USER_AGENT));
        String ip = ServletUtil.getClientIP(request);
        String client = SecurityUtil.obtainClient(request);
        LoginLogParam loginLog = new LoginLogParam()
                .setAccount(e.getUsername())
                .setLogin(false)
                .setClient(client)
                .setMsg(e.getMessage())
                .setIp(ip)
                .setOs(userAgent.getOs().getName())
                .setBrowser(userAgent.getBrowser().getName()+" "+userAgent.getVersion())
                .setLoginTime(LocalDateTime.now());
        loginLogService.add(loginLog);
    }
}
