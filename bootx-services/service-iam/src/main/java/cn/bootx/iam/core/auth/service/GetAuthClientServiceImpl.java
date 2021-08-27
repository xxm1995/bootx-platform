package cn.bootx.iam.core.auth.service;

import cn.bootx.iam.core.client.dao.ClientManager;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.starter.auth.authentication.GetAuthClientService;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.exception.ClientNotFoundException;
import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 获取认证终端
* @author xxm  
* @date 2021/8/25 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class GetAuthClientServiceImpl implements GetAuthClientService {
    private final ClientManager clientManager;

    @Override
    public AuthClient getAuthClient(String authClientCode) {
        Client client = clientManager.findByCode(authClientCode).orElseThrow(ClientNotFoundException::new);
        AuthClient authClient = new AuthClient();
        BeanUtil.copyProperties(client,authClient);
        return authClient;
    }
}
