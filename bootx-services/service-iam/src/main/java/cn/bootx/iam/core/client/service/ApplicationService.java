package cn.bootx.iam.core.client.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.client.dao.ApplicationManager;
import cn.bootx.iam.core.client.entity.Application;
import cn.bootx.iam.dto.client.ApplicationDto;
import cn.bootx.iam.param.client.ApplicationParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 认证应用
 * @author xxm
 * @date 2022-06-27
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ApplicationService {
    private final ApplicationManager applicationManager;

    /**
     * 添加
     */
    public void add(ApplicationParam param){
        Application application = Application.init(param);
        applicationManager.save(application);
    }

    /**
     * 修改
     */
    public void update(ApplicationParam param){
        Application application = applicationManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,application, CopyOptions.create().ignoreNullValue());
        applicationManager.updateById(application);
    }

    /**
     * 分页
     */
    public PageResult<ApplicationDto> page(PageParam pageParam,ApplicationParam applicationParam){
        return MpUtil.convert2DtoPageResult(applicationManager.page(pageParam,applicationParam));
    }

    /**
     * 获取单条
     */
    public ApplicationDto findById(Long id){
        return applicationManager.findById(id).map(Application::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<ApplicationDto> findAll(){
        return ResultConvertUtil.dtoListConvert(applicationManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        applicationManager.deleteById(id);
    }
}