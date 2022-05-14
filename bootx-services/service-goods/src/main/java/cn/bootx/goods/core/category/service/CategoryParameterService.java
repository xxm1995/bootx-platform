package cn.bootx.goods.core.category.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.dao.CategoryParameterManager;
import cn.bootx.goods.core.category.entity.CategoryParameter;
import cn.bootx.goods.dto.category.CategoryParameterDto;
import cn.bootx.goods.param.category.CategoryParameterParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类目参数
 * @author xxm
 * @date 2022-05-09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CategoryParameterService {
    private final CategoryParameterManager categoryParameterManager;

    /**
     * 添加
     */
    public CategoryParameterDto add(CategoryParameterParam param){
        CategoryParameter categoryParameter = CategoryParameter.init(param);
        return categoryParameterManager.save(categoryParameter).toDto();
    }

    /**
     * 修改
     */
    public CategoryParameterDto update(CategoryParameterParam param){
        CategoryParameter categoryParameter = categoryParameterManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,categoryParameter, CopyOptions.create().ignoreNullValue());
        return categoryParameterManager.updateById(categoryParameter).toDto();
    }

    /**
     * 分页
     */
    public PageResult<CategoryParameterDto> page(PageParam pageParam,CategoryParameterParam categoryParameterParam){
        return MpUtil.convert2DtoPageResult(categoryParameterManager.page(pageParam,categoryParameterParam));
    }

    /**
     * 获取单条
     */
    public CategoryParameterDto findById(Long id){
        return categoryParameterManager.findById(id).map(CategoryParameter::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<CategoryParameterDto> findAll(){
        return ResultConvertUtil.dtoListConvert(categoryParameterManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        categoryParameterManager.deleteById(id);
    }

    /**
     * 名称是否存在
     */
    public boolean existsByName(String name, Long groupId) {
        return categoryParameterManager.existedByName(name,groupId);
    }

    /**
     * 名称是否存在
     */
    public boolean existsByName(String name, Long groupId, Long id) {
        return categoryParameterManager.existedByName(name,groupId,id);
    }
}