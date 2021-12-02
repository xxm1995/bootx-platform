package cn.bootx.starter.audit.log.core.db.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.audit.log.core.db.entity.LoginLogDb;
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
public class LoginLogDbManager extends BaseManager<LoginLogDbMapper, LoginLogDb> {

    public Page<LoginLogDb> page(PageParam pageParam, LoginLogDto loginLogDto) {
        Page<LoginLogDb> mpPage = MpUtils.getMpPage(pageParam, LoginLogDb.class);
        return lambdaQuery()
                .orderByDesc(LoginLogDb::getLoginTime)
                .like(StrUtil.isNotBlank(loginLogDto.getAccount()), LoginLogDb::getAccount,loginLogDto.getAccount())
                .like(StrUtil.isNotBlank(loginLogDto.getClient()), LoginLogDb::getClient,loginLogDto.getClient())
                .page(mpPage);
    }
}
