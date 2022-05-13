package cn.bootx.goods.core.category.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.dao.CategoryParameterGroupManager;
import cn.bootx.goods.core.category.entity.CategoryParameterGroup;
import cn.bootx.goods.dto.category.CategoryParameterGroupDto;
import cn.bootx.goods.param.category.CategoryParameterGroupParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类目参数组
 * @author xxm
 * @date 2022-05-09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CategoryParameterGroupService {
    private final CategoryParameterGroupManager categoryParameterGroupManager;

    /**
     * 添加
     */
    public CategoryParameterGroupDto add(CategoryParameterGroupParam param){
        CategoryParameterGroup categoryParameterGroup = CategoryParameterGroup.init(param);
        return categoryParameterGroupManager.save(categoryParameterGroup).toDto();
    }

    /**
     * 修改
     */
    public CategoryParameterGroupDto update(CategoryParameterGroupParam param){
        CategoryParameterGroup categoryParameterGroup = categoryParameterGroupManager.findById(param.getId()).orElseThrow(DataNotExistException::new);
        param.setId(null);
        BeanUtil.copyProperties(param,categoryParameterGroup, CopyOptions.create().ignoreNullValue());
        return categoryParameterGroupManager.updateById(categoryParameterGroup).toDto();
    }

    /**
     * 分页
     */
    public PageResult<CategoryParameterGroupDto> page(PageParam pageParam,CategoryParameterGroupParam categoryParameterGroupParam){
        return MpUtil.convert2DtoPageResult(categoryParameterGroupManager.page(pageParam,categoryParameterGroupParam));
    }

    /**
     * 获取单条
     */
    public CategoryParameterGroupDto findById(Long id){
        return categoryParameterGroupManager.findById(id).map(CategoryParameterGroup::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<CategoryParameterGroupDto> findAll(){
        return ResultConvertUtil.dtoListConvert(categoryParameterGroupManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        categoryParameterGroupManager.deleteById(id);
    }
}