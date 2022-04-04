package cn.bootx.starter.dingtalk.core.access.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.starter.dingtalk.dto.access.AccessTokenResult;
import cn.hutool.cache.Cache;
import cn.hutool.cache.CacheUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

import static cn.bootx.starter.dingtalk.code.DingTalkCode.*;

/**
 * 钉钉访问凭证
 * @author xxm
 * @date 2022/4/2
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DingAccessService {

    /** 缓存, 有效期两小时 容量500 先进先出缓存. */
    private final Cache<String, String> appAccessTokenCache = CacheUtil.newFIFOCache(500,1000*60*60*2);
    private final Cache<String, String> userAccessTokenCache = CacheUtil.newFIFOCache(500,1000*60*60*2);

    /**
     * 企业内部应用的access_token
     */
    public String getAppAccessToken(String appKey, String appSecret){
        String accessToken = appAccessTokenCache.get(appKey,false);
        if (StrUtil.isNotBlank(accessToken)){
            return accessToken;
        }
        // 获取accessToken
        Map<String,String> map = new HashMap<>();
        map.put(APP_KEY,appKey);
        map.put(APP_SECRET,appSecret);
        String responseBody =  HttpUtil.createGet(StrUtil.format(APP_ACCESS_TOKEN_URL, map))
                .execute()
                .body();
        AccessTokenResult<?> dingTalkResult = JacksonUtil.toBean(responseBody, AccessTokenResult.class);
        accessToken = dingTalkResult.getAccessToken();
        if (StrUtil.isNotBlank(accessToken)){
            appAccessTokenCache.put(appKey,accessToken);
            return accessToken;
        } else {
            throw new BizException("获取钉钉应用AccessToken失败");
        }
    }

    /**
     * 获取用户token
     */
    public String getUserAccessToken(String appKey, String appSecret,String authCode) {
        String accessToken = appAccessTokenCache.get(appKey,false);
        if (StrUtil.isNotBlank(accessToken)){
            return accessToken;
        }
        // 获取accessToken
        Map<String,String> map = new HashMap<>();
        map.put(CLIENT_ID,appKey);
        map.put(CLIENT_SECRET,appSecret);
        map.put(CODE,authCode);
        map.put(GRANT_TYPE,AUTH_AUTHORIZATION_CODE);
        String responseBody =  HttpUtil.createPost(APP_ACCESS_TOKEN_URL)
                .body(JacksonUtil.toJson(map))
                .execute()
                .body();
        AccessTokenResult<?> dingTalkResult = JacksonUtil.toBean(responseBody, AccessTokenResult.class);
        accessToken = dingTalkResult.getAccessToken();
        if (StrUtil.isNotBlank(accessToken)){
            userAccessTokenCache.put(appKey,accessToken);
            return accessToken;
        } else {
            throw new BizException("获取钉钉用户AccessToken失败");
        }
    }

    /**
     * 生成第三方登录网址
     */
    public String genThirdLoginUrl(String redirectUri,String responseType,String appKey){
        Map<String,String> map = new HashMap<>();
        map.put(REDIRECT_URI,redirectUri);
        map.put(RESPONSE_TYPE,responseType);
        map.put(CLIENT_ID,appKey);
        map.put(SCOPE,OPEN_ID);
        map.put(PROMPT,"consent");
        return StrUtil.format(THIRD_LOGIN_URL,map);
    }

    /**
     * 通过免登码获取用户信息
     */
    public void x(){

    }

}
