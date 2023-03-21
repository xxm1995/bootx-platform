package cn.bootx.iam.core.auth.handler;

import cn.bootx.common.core.code.WebHeaderCode;
import cn.bootx.iam.core.user.service.UserExpandInfoService;
import cn.bootx.starter.audit.log.param.LoginLogParam;
import cn.bootx.starter.audit.log.service.LoginLogService;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.handler.LoginSuccessHandler;
import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

/**
 * 登录成功处理
 *
 * @author xxm
 * @date 2021/8/13
 */
@Component
@RequiredArgsConstructor
public class LoginSuccessHandlerImpl implements LoginSuccessHandler {

    private final LoginLogService loginLogService;

    private final UserExpandInfoService userExpandInfoService;

    @Override
    public void onLoginSuccess(HttpServletRequest request, HttpServletResponse response,
            AuthInfoResult authInfoResult) {
        UserAgent userAgent = UserAgentUtil.parse(request.getHeader(WebHeaderCode.USER_AGENT));
        String ip = ServletUtil.getClientIP(request);
        LoginLogParam loginLog = new LoginLogParam().setLogin(true)
            .setUserId(authInfoResult.getUserDetail().getId())
            .setClient(authInfoResult.getClient())
            .setLoginType(authInfoResult.getLoginType())
            .setAccount(authInfoResult.getUserDetail().getUsername())
            .setIp(ip)
            .setOs(userAgent.getOs().getName())
            .setBrowser(userAgent.getBrowser().getName() + " " + userAgent.getVersion())
            .setLoginTime(LocalDateTime.now());
        loginLogService.add(loginLog);
        userExpandInfoService.updateLoginTime(loginLog.getUserId());
    }

}
