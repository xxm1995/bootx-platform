package cn.bootx.starter.auth.authentication;

import cn.bootx.starter.auth.entity.AuthLoginType;

/**
* 获取认证终端对象服务
* @author xxm
* @date 2021/8/25
*/
public interface GetAuthLoginTypeService {

    AuthLoginType getAuthLoginType(String authClientCode);
}
