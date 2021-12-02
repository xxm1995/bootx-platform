package cn.bootx.starter.audit.log.core.mongo.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.audit.log.core.mongo.convert.LogConvert;
import cn.bootx.starter.audit.log.core.mongo.dao.OperateLogMongoRepository;
import cn.bootx.starter.audit.log.core.mongo.entity.OperateLogMongo;
import cn.bootx.starter.audit.log.dto.OperateLogDto;
import cn.bootx.starter.audit.log.param.OperateLogParam;
import cn.bootx.starter.audit.log.service.OperateLogService;
import cn.hutool.core.util.IdUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**   
* 
* @author xxm  
* @date 2021/12/2 
*/
@Slf4j
@Service
@ConditionalOnProperty(prefix = "bootx.starter.audit-log", value = "store", havingValue = "mongo")
@RequiredArgsConstructor
public class OperateLogMongoService implements OperateLogService {
    private final OperateLogMongoRepository repository;

    @Override
    @Async("asyncExecutor")
    public void add(OperateLogParam operateLog) {
        OperateLogMongo operateLogMongo = LogConvert.CONVERT.convert(operateLog);
        operateLogMongo.setId(IdUtil.getSnowflake().nextId());
        repository.save(operateLogMongo);
    }

    @Override
    public OperateLogDto findById(Long id) {
        return repository.findById(id).map(OperateLogMongo::toDto).orElse(null);
    }

    @Override
    public PageResult<OperateLogDto> page(PageParam pageParam, OperateLogDto operateLogDto) {

        Sort sort = Sort.by(Sort.Order.desc("id"));

        //设置分页条件 (第几页，每页大小，排序)
        Pageable pageable = PageRequest.of(pageParam.getCurrent()-1, pageParam.getSize(), sort);
        Page<OperateLogMongo> page = repository.findAll(pageable);
        List<OperateLogDto> records = page.getContent().stream()
                .map(OperateLogMongo::toDto)
                .collect(Collectors.toList());

        return new PageResult<OperateLogDto>()
                .setCurrent(pageParam.getCurrent())
                .setSize(pageParam.getSize())
                .setRecords(records)
                .setTotal(page.getTotalElements());
    }

    @Override
    public void delete(Long id) {
        repository.deleteById(id);
    }
}
