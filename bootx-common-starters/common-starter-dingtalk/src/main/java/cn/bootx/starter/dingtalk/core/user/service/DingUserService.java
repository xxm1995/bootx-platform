package cn.bootx.starter.dingtalk.core.user.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.starter.dingtalk.core.base.entity.DingTalkResult;
import cn.bootx.starter.dingtalk.core.base.service.DingAccessService;
import cn.bootx.starter.dingtalk.core.user.entity.UserIdResult;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static cn.bootx.starter.dingtalk.code.DingTalkCode.*;

/**   
* 钉钉用户信息
* @author xxm  
* @date 2022/7/17 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DingUserService {
    private final DingAccessService dingAccessService;
    /**
     * 根据unionid获取用户userid
     * <a href="https://open.dingtalk.com/document/isvapp-server/query-a-user-by-the-union-id">...</a>
     */
    public UserIdResult getUserIdByUnionId(String unionId){
        String accessToken = dingAccessService.getAccessToken();
        Map<String,String> map = new HashMap<>(1);
        map.put(UNION_ID,unionId);
        String responseBody = HttpUtil.createPost(StrUtil.format(USER_GET_URL, accessToken))
                .body(JacksonUtil.toJson(map))
                .execute()
                .body();
        DingTalkResult<UserIdResult> dingTalkResult = JacksonUtil.toBean(responseBody, new TypeReference<DingTalkResult<UserIdResult>>() {
        });
        if (!Objects.equals(dingTalkResult.getCode(),SUCCESS_CODE)){
            throw new BizException(dingTalkResult.getMsg());
        }
        return dingTalkResult.getResult();
    }
}
