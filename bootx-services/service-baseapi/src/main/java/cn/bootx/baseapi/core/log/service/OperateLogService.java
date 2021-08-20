package cn.bootx.baseapi.core.log.service;

import cn.bootx.baseapi.core.log.dao.OperateLogManager;
import cn.bootx.baseapi.core.log.entity.OperateLog;
import cn.bootx.baseapi.dto.log.OperateLogDto;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**   
* 
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
    public void add(OperateLog operateLog){
        operateLogManager.save(operateLog);
    }

    /**
     * 获取
     */
    public OperateLogDto findById(Long id){
        return operateLogManager.findById(id).map(OperateLog::toDto).orElse(null);
    }

    /**
     * 分页
     */
    public PageResult<OperateLogDto> page(PageParam pageParam){
        return MpUtils.convert2PageResult(operateLogManager.page(pageParam));
    }

    /**
     * 删除
     */
    public void delete(Long id){
        operateLogManager.deleteById(id);
    }
}
