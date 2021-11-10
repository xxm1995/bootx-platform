package cn.bootx.starter.auth.authentication;

import cn.bootx.starter.auth.entity.AuthClient;

/**
* 获取认证终端对象服务
* @author xxm
* @date 2021/8/25
*/
public interface GetAuthClientService {

    AuthClient getAuthClient(String authClientCode);
}
