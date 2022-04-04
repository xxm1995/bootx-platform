package cn.bootx.iam.core.social.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.social.dao.UserSocialLoginManager;
import cn.bootx.iam.core.social.entity.UserSocialLogin;
import cn.bootx.iam.dto.user.UserSocialLoginDto;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**   
* 用户三方账号查询
* @author xxm  
* @date 2022/4/2 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserSocialQueryService {
    private final UserSocialLoginManager userSocialLoginManager;

    /**
     * 分页
     */
    public PageResult<UserSocialLoginDto> page(PageParam pageParam){
        return MpUtil.convert2DtoPageResult(userSocialLoginManager.page(pageParam));
    }

    /**
     * 分页
     */
    public UserSocialLoginDto findById(Long id){
        return userSocialLoginManager.findById(id).map(UserSocialLogin::toDto)
                .orElseThrow(DataNotExistException::new);
    }

    /**
     * 查询
     */
    public Optional<UserSocialLogin> findByOpenid(String openId, SFunction<UserSocialLogin, String> function){
        return userSocialLoginManager.findByField(function,openId);
    }
}
