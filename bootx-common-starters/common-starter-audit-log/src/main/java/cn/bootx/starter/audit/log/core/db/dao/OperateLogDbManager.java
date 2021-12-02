package cn.bootx.starter.audit.log.core.db.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.audit.log.core.db.entity.OperateLogDb;
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
public class OperateLogDbManager extends BaseManager<OperateLogDbMapper, OperateLogDb> {

    public Page<OperateLogDb> page(PageParam pageParam, OperateLogDto operateLogDto) {
        Page<OperateLogDb> mpPage = MpUtils.getMpPage(pageParam, OperateLogDb.class);
        return lambdaQuery()
                .like(StrUtil.isNotBlank(operateLogDto.getUsername()), OperateLogDb::getUsername,operateLogDto.getUsername())
                .like(StrUtil.isNotBlank(operateLogDto.getTitle()), OperateLogDb::getTitle,operateLogDto.getTitle())
                .eq(Objects.nonNull(operateLogDto.getBusinessType()), OperateLogDb::getBusinessType,operateLogDto.getBusinessType())
                .orderByDesc(OperateLogDb::getOperateTime)
                .page(mpPage);
    }
}
