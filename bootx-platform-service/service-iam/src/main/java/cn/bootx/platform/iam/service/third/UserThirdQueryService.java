package cn.bootx.platform.iam.service.third;

import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.core.exception.DataNotExistException;
import cn.bootx.platform.core.rest.param.PageParam;
import cn.bootx.platform.core.rest.result.PageResult;
import cn.bootx.platform.iam.bo.third.UserThirdBindInfo;
import cn.bootx.platform.iam.bo.third.UserThirdBindInfo.BindInfo;
import cn.bootx.platform.iam.dao.third.UserThirdInfoManager;
import cn.bootx.platform.iam.dao.third.UserThirdManager;
import cn.bootx.platform.iam.entity.third.UserThird;
import cn.bootx.platform.iam.entity.third.UserThirdInfo;
import cn.bootx.platform.iam.result.third.UserThirdDto;
import cn.bootx.platform.starter.auth.code.AuthLoginTypeCode;
import cn.bootx.platform.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 用户三方账号查询
 *
 * @author xxm
 * @since 2022/4/2
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserThirdQueryService {

    private final UserThirdManager userThirdManager;

    private final UserThirdInfoManager userThirdInfoManager;

    /**
     * 分页
     */
    public PageResult<UserThirdDto> page(PageParam pageParam) {
        return MpUtil.toPageResult(userThirdManager.page(pageParam));
    }

    /**
     * 获取详情
     */
    public UserThirdDto findById(Long id) {
        return userThirdManager.findById(id).map(UserThird::toResult).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取用户绑定的详细信息
     */
    public UserThirdBindInfo getThirdBindInfo() {
        Long userId = SecurityUtil.getUserId();
        UserThirdBindInfo userThirdBindInfo = new UserThirdBindInfo();
        Map<String, UserThirdInfo> thirdInfoMap = userThirdInfoManager.findAllByUser(userId)
            .stream()
            .collect(Collectors.toMap(UserThirdInfo::getClientCode, Function.identity()));
        userThirdBindInfo.setWeChat(getBindInfo(thirdInfoMap, AuthLoginTypeCode.WE_CHAT));
        userThirdBindInfo.setWeChatOpen(getBindInfo(thirdInfoMap, AuthLoginTypeCode.WE_CHAT_OPEN));
        userThirdBindInfo.setWeCom(getBindInfo(thirdInfoMap, AuthLoginTypeCode.WE_COM));
        userThirdBindInfo.setDingTalk(getBindInfo(thirdInfoMap, AuthLoginTypeCode.DING_TALK));

        return userThirdBindInfo;
    }

    /**
     * 获取微信绑定信息
     */
    private BindInfo getBindInfo(Map<String, UserThirdInfo> thirdInfoMap, String clientCode) {
        UserThirdInfo userThirdInfo = thirdInfoMap.get(clientCode);
        BindInfo bindInfo = new BindInfo();
        if (Objects.nonNull(userThirdInfo)) {
            bindInfo.setBind(true);
            bindInfo.setUsername(userThirdInfo.getUsername());
            bindInfo.setThirdUserId(userThirdInfo.getThirdUserId());
        }
        return bindInfo;
    }

}
