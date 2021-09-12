package cn.bootx.iam.core.user.service;

import cn.bootx.iam.core.user.dao.UserInfoManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 用户查询
* @author xxm  
* @date 2021/7/19 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserQueryService {
    private final UserInfoManager userInfoManager;

}
