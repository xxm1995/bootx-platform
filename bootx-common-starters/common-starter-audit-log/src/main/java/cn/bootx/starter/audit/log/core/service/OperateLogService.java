package cn.bootx.starter.audit.log.core.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.audit.log.core.dao.OperateLogManager;
import cn.bootx.starter.audit.log.core.entity.OperateLogger;
import cn.bootx.starter.audit.log.dto.OperateLogDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**   
* 操作日志
* @author xxm  
* @date 2021/8/12 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class OperateLogService {
    private final OperateLogManager operateLogManager;

    /**
     * 添加
     */
    @Async("asyncExecutor")
    public void add(OperateLogger operateLogger){
        operateLogManager.save(operateLogger);
    }

    /**
     * 获取
     */
    public OperateLogDto findById(Long id){
        return operateLogManager.findById(id).map(OperateLogger::toDto).orElse(null);
    }

    /**
     * 分页
     */
    public PageResult<OperateLogDto> page(PageParam pageParam, OperateLogDto operateLogDto){
        return MpUtils.convert2PageResult(operateLogManager.page(pageParam,operateLogDto));
    }

    /**
     * 删除
     */
    public void delete(Long id){
        operateLogManager.deleteById(id);
    }
}
