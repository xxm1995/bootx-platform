package cn.bootx.iam.core.auth.handler;

import cn.bootx.baseapi.core.log.entity.LoginLog;
import cn.bootx.baseapi.core.log.service.LoginLogService;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.handler.LoginFailureHandler;
import cn.hutool.extra.servlet.ServletUtil;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
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

        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        OperatingSystem operatingSystem = userAgent.getOperatingSystem();
        Browser browser = userAgent.getBrowser();
        String ip = ServletUtil.getClientIP(request);
        LoginLog loginLog = new LoginLog()
                .setUserName(e.getUsername())
                .setLogin(false)
                .setMsg(e.getMessage())
                .setIp(ip)
                .setOs(operatingSystem.getName())
                .setBrowser(browser.getName())
                .setLoginTime(LocalDateTime.now());
        loginLogService.add(loginLog);
    }
}
