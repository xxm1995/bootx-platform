package cn.bootx.iam.core.auth.handler;

import cn.bootx.iam.core.client.dao.ApplicationManager;
import cn.bootx.iam.core.client.entity.Application;
import cn.bootx.starter.auth.authentication.GetAuthApplicationService;
import cn.bootx.starter.auth.entity.AuthApplication;
import cn.bootx.starter.auth.exception.ApplicationNotFoundException;
import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
* 获取认证应用
* @author xxm
* @date 2022/6/27
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class GetAuthApplicationServiceImpl implements GetAuthApplicationService {
    private final ApplicationManager applicationManager;

    @Override
    public AuthApplication getAuthApplication(String authApplicationCode) {
        Application application = applicationManager.findByCode(authApplicationCode).orElseThrow(ApplicationNotFoundException::new);
        AuthApplication authApplication = new AuthApplication();
        BeanUtil.copyProperties(application,authApplication);
        return authApplication;
    }
}
