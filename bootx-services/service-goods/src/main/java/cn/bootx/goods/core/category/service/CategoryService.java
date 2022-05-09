package cn.bootx.goods.core.category.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.goods.core.category.convert.CategoryConvert;
import cn.bootx.goods.core.category.dao.CategoryManager;
import cn.bootx.goods.core.category.entity.Category;
import cn.bootx.goods.core.category.handler.CategoryTreeHandler;
import cn.bootx.goods.dto.category.CategoryDto;
import cn.bootx.goods.dto.category.CategoryTreeNode;
import cn.bootx.goods.exception.category.CategoryAlreadyExistedException;
import cn.bootx.goods.exception.category.CategoryNotExistedException;
import cn.bootx.goods.param.category.CategoryParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
* 类目
* @author xxm
* @date 2020/11/19
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class CategoryService {
    private final CategoryManager categoryManager;

    /**
     * 添加新类目
     */
    @Transactional(rollbackFor = Exception.class)
    public void add(CategoryParam param) {
        int level = 1;
        // 获取新增类目的层级
        if (Objects.nonNull(param.getPid())){
            Category category = categoryManager.findById(param.getPid()).orElseThrow(() -> new BizException("父类不存在"));
            level = category.getLevel() + 1;
        }
        if (categoryManager.existsName(param.getName())) {
            throw new CategoryAlreadyExistedException();
        }
        Category category = CategoryConvert.CONVERT.convert(param);
        category.setLevel(level);
        categoryManager.save(category);
    }

    /**
     * 更新类目基本信息
     */
    @Transactional(rollbackFor = Exception.class)
    public CategoryDto update(CategoryDto param) {
        Category category = categoryManager.findById(param.getId()).orElseThrow(CategoryNotExistedException::new);
        // pid不可以更新
        param.setPid(null);
        BeanUtil.copyProperties(param,category, CopyOptions.create().ignoreNullValue());
        return categoryManager.updateById(category).toDto();
    }

    /**
     * 获取所有类目
     */
    public List<CategoryDto> findAll(){
        return categoryManager.findAll()
                .stream()
                .map(Category::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 根据 id 获取相应的类目
     */
    public CategoryDto getById(Long id){
        return categoryManager.findById(id).map(Category::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取类目树
     */
    public List<CategoryTreeNode> findTree() {
        List<CategoryDto> dtos = this.findAll();
        return CategoryTreeHandler.build(dtos);
    }

    /**
     * 根据 id 删除相应的类目
     */
    public void delete(Long id){

        categoryManager.deleteById(id);
    }
}
