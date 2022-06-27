package cn.bootx.starter.auth.authentication;

import cn.bootx.starter.auth.entity.AuthApplication;

/**
* 获取认证应用
* @author xxm  
* @date 2022/6/27 
*/
public interface GetAuthApplicationService {
    /**
     * 认证应用
     */
    AuthApplication getAuthApplication(String authApplicationCode);

}
