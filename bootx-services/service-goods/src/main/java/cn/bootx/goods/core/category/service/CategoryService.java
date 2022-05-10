package cn.bootx.goods.core.category.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.goods.code.CategoryCode;
import cn.bootx.goods.core.category.convert.CategoryConvert;
import cn.bootx.goods.core.category.dao.CategoryManager;
import cn.bootx.goods.core.category.entity.Category;
import cn.bootx.goods.core.category.util.CategoryTreeUtil;
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

import java.util.Comparator;
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
        // 不传pid为根类目
        if (Objects.nonNull(param.getPid())){
            Category category = categoryManager.findById(param.getPid()).orElseThrow(() -> new BizException("父类不存在"));
            level = category.getLevel() + 1;
            if (level > CategoryCode.LEVEL_CHILD){
                throw new BizException("类目层级最高为三层");
            }

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
    public CategoryDto findById(Long id){
        return categoryManager.findById(id).map(Category::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取类目树
     */
    public List<CategoryTreeNode> findTree() {
        List<Category> categories = categoryManager.findAll().stream()
                .sorted(Comparator.comparingDouble(Category::getSortNo))
                .collect(Collectors.toList());
        return CategoryTreeUtil.build(categories);
    }

    /**
     * 判断类目是否已经存在
     */
    public boolean existsByName(String name) {
        return categoryManager.existsName(name);
    }

    /**
     * 判断类目是否已经存在
     */
    public boolean existsByName(String name, Long id) {
        return categoryManager.existsName(name,id);
    }

        /**
         * 根据 id 删除相应的类目
         */
    public void delete(Long id){
        categoryManager.deleteById(id);
    }

    /**
     * 绑定品牌
     */
    public void bindBrand(){

    }

    /**
     * 绑定规格
     */
    public void bindSpecification(){

    }

    /**
     * 绑定参数
     */
    public void bindParameter(){

    }
}
