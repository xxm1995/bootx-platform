package cn.bootx.starter.audit.log.core.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.audit.log.core.entity.LoginLog;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
* 登录日志
* @author xxm  
* @date 2021/8/12 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class LoginLogManager extends BaseManager<LoginLogMapper, LoginLog> {

    public Page<LoginLog> page(PageParam pageParam, LoginLogDto loginLogDto) {
        Page<LoginLog> mpPage = MpUtils.getMpPage(pageParam, LoginLog.class);
        return lambdaQuery()
                .orderByDesc(LoginLog::getLoginTime)
                .like(StrUtil.isNotBlank(loginLogDto.getAccount()),LoginLog::getAccount,loginLogDto.getAccount())
                .like(StrUtil.isNotBlank(loginLogDto.getClient()),LoginLog::getClient,loginLogDto.getClient())
                .page(mpPage);
    }
}
