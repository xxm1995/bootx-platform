package cn.bootx.starter.auth.online;

import cn.bootx.common.core.annotation.OperateLog;
import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.enums.BusinessType;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
* 在线用户
* @author xxm
* @date 2021/9/8
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class OnlineUserService {
    @SuppressWarnings("FieldCanBeLocal")
    private final String SessionPattern = "AccessToken:login:session:*";

    private final StringRedisTemplate stringRedisTemplate;
    private final RedisTemplate<String,SaSession> objectRedisTemplate;

    /**
     * 分页查询
     */
    public PageResult<OnlineUserDto> page(PageParam pageParam){
        ArrayList<String> keys = Optional.ofNullable(stringRedisTemplate.keys(SessionPattern))
                .map(ArrayList::new)
                .orElseGet(ArrayList::new);
        List<String> list = new ArrayList<>();
        int start = pageParam.start();
        int end = pageParam.end();
        for (int i = start; i < end; i++) {
            if (i >= keys.size()) {
                break;
            }else {
                list.add(keys.get(i));
            }
        }
        List<OnlineUserDto> onlineUsers = Optional.ofNullable(objectRedisTemplate.opsForValue().multiGet(list))
                .orElseGet(ArrayList::new)
                .stream()
                .map(this::convert)
                .collect(Collectors.toList());
        return new PageResult<OnlineUserDto>()
                .setCurrent(pageParam.getCurrent())
                .setSize(pageParam.getSize())
                .setTotal(keys.size())
                .setRecords(onlineUsers);
    }

    /**
     * 获取单条
     */
    public OnlineUserDto findBySessionId(String sessionId){
        SaSession saSession = Optional.ofNullable(objectRedisTemplate.opsForValue().get(sessionId)).orElseThrow(() -> new BizException("会话不存在"));
        return this.convert(saSession);
    }

    /**
     * 转换if在线用户对象
     */
    private OnlineUserDto convert(SaSession saSession){
        UserDetail userDetail = saSession.getModel(CommonCode.USER, UserDetail.class);
        List<OnlineUserDto.TokenSign> tokenSignList = saSession.getTokenSignList().stream()
                .map(tokenSign -> new OnlineUserDto.TokenSign()
                        .setDevice(tokenSign.getDevice())
                        .setValue(tokenSign.getValue()))
                .collect(Collectors.toList());

        return new OnlineUserDto()
                .setUserId(userDetail.getId())
                .setUserName(userDetail.getUsername())
                .setName(userDetail.getName())
                .setTimeout(saSession.getTimeout())
                .setCreationTime(LocalDateTimeUtil.of(saSession.getCreateTime()))
                .setSessionId(saSession.getId())
                .setTokenSigns(tokenSignList);
    }

    /**
     * 下线
     */
    @OperateLog(title = "强退用户",businessType = BusinessType.FORCE, saveParam = true)
    public void logoutByUserId(Long userId){
        StpUtil.logoutByLoginId(userId);
    }
}
