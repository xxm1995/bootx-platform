package cn.bootx.baseapi.core.log.dao;

import cn.bootx.baseapi.core.log.entity.OperateLog;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 操作日志
* @author xxm  
* @date 2021/8/12 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class OperateLogManager extends BaseManager<OperateLogMapper, OperateLog> {
    public Page<OperateLog> page(PageParam pageParam) {
        Page<OperateLog> mpPage = MpUtils.getMpPage(pageParam, OperateLog.class);
        return lambdaQuery().page(mpPage);
    }
}
