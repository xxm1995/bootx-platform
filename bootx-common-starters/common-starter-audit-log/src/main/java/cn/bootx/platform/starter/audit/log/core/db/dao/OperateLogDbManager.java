package cn.bootx.platform.starter.audit.log.core.db.dao;

import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.starter.audit.log.core.db.entity.OperateLogDb;
import cn.bootx.platform.starter.audit.log.param.OperateLogParam;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 操作日志
 *
 * @author xxm
 * @date 2021/8/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OperateLogDbManager extends BaseManager<OperateLogDbMapper, OperateLogDb> {

    public Page<OperateLogDb> page(PageParam pageParam, OperateLogParam operateLogParam) {
        Page<OperateLogDb> mpPage = MpUtil.getMpPage(pageParam, OperateLogDb.class);
        return lambdaQuery()
            .like(StrUtil.isNotBlank(operateLogParam.getUsername()), OperateLogDb::getUsername,
                    operateLogParam.getUsername())
            .like(StrUtil.isNotBlank(operateLogParam.getTitle()), OperateLogDb::getTitle, operateLogParam.getTitle())
            .eq(Objects.nonNull(operateLogParam.getBusinessType()), OperateLogDb::getBusinessType,
                    operateLogParam.getBusinessType())
            .orderByDesc(OperateLogDb::getOperateTime)
            .page(mpPage);
    }

}
