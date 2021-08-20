package cn.bootx.baseapi.core.log.dao;

import cn.bootx.baseapi.core.log.entity.LoginLog;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
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
    public Page<LoginLog> page(PageParam pageParam) {
        Page<LoginLog> mpPage = MpUtils.getMpPage(pageParam, LoginLog.class);
        return lambdaQuery().page(mpPage);
    }
}
