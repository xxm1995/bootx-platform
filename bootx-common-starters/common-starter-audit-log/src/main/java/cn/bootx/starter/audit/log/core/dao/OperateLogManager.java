package cn.bootx.starter.audit.log.core.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.audit.log.core.entity.OperateLogger;
import cn.bootx.starter.audit.log.dto.OperateLogDto;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**   
* 操作日志
* @author xxm  
* @date 2021/8/12 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class OperateLogManager extends BaseManager<OperateLogMapper, OperateLogger> {

    public Page<OperateLogger> page(PageParam pageParam, OperateLogDto operateLogDto) {
        Page<OperateLogger> mpPage = MpUtils.getMpPage(pageParam, OperateLogger.class);
        return lambdaQuery()
                .like(StrUtil.isNotBlank(operateLogDto.getUsername()), OperateLogger::getUsername,operateLogDto.getUsername())
                .like(StrUtil.isNotBlank(operateLogDto.getTitle()), OperateLogger::getTitle,operateLogDto.getTitle())
                .eq(Objects.nonNull(operateLogDto.getBusinessType()), OperateLogger::getBusinessType,operateLogDto.getBusinessType())
                .orderByDesc(OperateLogger::getOperateTime)
                .page(mpPage);
    }
}
