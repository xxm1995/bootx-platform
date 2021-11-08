package cn.bootx.starter.audit.log.core.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.audit.log.core.dao.LoginLogManager;
import cn.bootx.starter.audit.log.core.entity.LoginLog;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
* 登陆日志
* @author xxm
* @date 2021/8/12
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class LoginLogService {
    private final LoginLogManager loginLogManager;

    /**
     * 添加
     */
    @Async("asyncExecutor")
    public void add(LoginLog loginLog){
        loginLogManager.save(loginLog);
    }

    /**
     * 获取
     */
    public LoginLogDto findById(Long id){
        return loginLogManager.findById(id).map(LoginLog::toDto).orElse(null);
    }

    /**
     * 分页
     */
    public PageResult<LoginLogDto> page(PageParam pageParam, LoginLogDto loginLogDto){
        return MpUtils.convert2PageResult(loginLogManager.page(pageParam,loginLogDto));
    }

    /**
     * 删除
     */
    public void delete(Long id){
        loginLogManager.deleteById(id);
    }
}
