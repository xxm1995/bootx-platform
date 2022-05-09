package cn.bootx.goods.core.category.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.dao.SpecificationManager;
import cn.bootx.goods.core.category.entity.Specification;
import cn.bootx.goods.dto.spec.SpecificationDto;
import cn.bootx.goods.param.category.SpecificationParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 规格
 * @author xxm
 * @date 2022-05-09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SpecificationService {
    private final SpecificationManager specificationManager;

    /**
     * 添加
     */
    public SpecificationDto add(SpecificationParam param){
        Specification specification = Specification.init(param);
        return specificationManager.save(specification).toDto();
    }

    /**
     * 修改
     */
    public SpecificationDto update(SpecificationParam param){
        Specification specification = specificationManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,specification, CopyOptions.create().ignoreNullValue());
        return specificationManager.updateById(specification).toDto();
    }

    /**
     * 分页
     */
    public PageResult<SpecificationDto> page(PageParam pageParam,SpecificationParam specificationParam){
        return MpUtil.convert2DtoPageResult(specificationManager.page(pageParam,specificationParam));
    }

    /**
     * 获取单条
     */
    public SpecificationDto findById(Long id){
        return specificationManager.findById(id).map(Specification::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<SpecificationDto> findAll(){
        return ResultConvertUtil.dtoListConvert(specificationManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        specificationManager.deleteById(id);
    }

}