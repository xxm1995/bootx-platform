package cn.bootx.starter.audit.log.core.mongo.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.audit.log.core.mongo.convert.LogConvert;
import cn.bootx.starter.audit.log.core.mongo.dao.LoginLogMongoRepository;
import cn.bootx.starter.audit.log.core.mongo.entity.LoginLogMongo;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import cn.bootx.starter.audit.log.param.LoginLogParam;
import cn.bootx.starter.audit.log.service.LoginLogService;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.IdUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
public class LoginLogMongoService implements LoginLogService {
    private final LoginLogMongoRepository repository;

    @Override
    public void add(LoginLogParam loginLog) {
        LoginLogMongo loginLogMongo = LogConvert.CONVERT.convert(loginLog);
        ThreadUtil.safeSleep(10000);
        loginLogMongo.setId(IdUtil.getSnowflake().nextId());
        repository.save(loginLogMongo);
    }

    @Override
    public LoginLogDto findById(Long id) {
        return repository.findById(id).map(LoginLogMongo::toDto).orElse(null);
    }

    @Override
    public PageResult<LoginLogDto> page(PageParam pageParam, LoginLogDto loginLogDto) {
        Sort sort = Sort.by(Sort.Order.desc("id"));

        //设置分页条件 (第几页，每页大小，排序)
        Pageable pageable = PageRequest.of(pageParam.getCurrent()-1, pageParam.getSize(), sort);
        Page<LoginLogMongo> page = repository.findAll(pageable);
        List<LoginLogDto> records = page.getContent().stream()
                .map(LoginLogMongo::toDto)
                .collect(Collectors.toList());

        return new PageResult<LoginLogDto>()
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
