package cn.bootx.iam.core.social.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.social.dao.UserSocialInfoManager;
import cn.bootx.iam.core.social.dao.UserSocialManager;
import cn.bootx.iam.core.social.entity.UserSocial;
import cn.bootx.iam.core.social.entity.UserSocialInfo;
import cn.bootx.iam.dto.user.UserSocialBindInfo;
import cn.bootx.iam.dto.user.UserSocialBindInfo.BindInfo;
import cn.bootx.iam.dto.user.UserSocialDto;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.iam.code.OpenIdLoginType.*;

/**   
* 用户三方账号查询
* @author xxm  
* @date 2022/4/2 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserSocialQueryService {
    private final UserSocialManager userSocialManager;
    private final UserSocialInfoManager userSocialInfoManager;

    /**
     * 分页
     */
    public PageResult<UserSocialDto> page(PageParam pageParam){
        return MpUtil.convert2DtoPageResult(userSocialManager.page(pageParam));
    }

    /**
     * 获取详情
     */
    public UserSocialDto findById(Long id){
        return userSocialManager.findById(id).map(UserSocial::toDto)
                .orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取用户绑定的详细信息
     */
    public UserSocialBindInfo getSocialBindInfo(){
        Long userId = SecurityUtil.getUserId();
        UserSocialBindInfo userSocialBindInfo = new UserSocialBindInfo();
        Map<String, UserSocialInfo> socialInfoMap = userSocialInfoManager.findAllByUser(userId).stream()
                .collect(Collectors.toMap(UserSocialInfo::getClientCode, o -> o));
        userSocialBindInfo.setWeChat(getBindInfo(socialInfoMap,WE_CHAT));
        userSocialBindInfo.setWeCom(getBindInfo(socialInfoMap,WE_COM));
        userSocialBindInfo.setDingTalk(getBindInfo(socialInfoMap,DING_TALK));
        return userSocialBindInfo;
    }

    /**
     * 获取微信绑定信息
     */
    private BindInfo getBindInfo(Map<String, UserSocialInfo> socialInfoMap, String clientCode){
        UserSocialInfo userSocialInfo = socialInfoMap.get(clientCode);
        BindInfo bindInfo = new BindInfo();
        if (Objects.nonNull(userSocialInfo)){
            bindInfo.setBind(true);
            bindInfo.setUsername(userSocialInfo.getUsername());
        }
        return bindInfo;
    }
}
