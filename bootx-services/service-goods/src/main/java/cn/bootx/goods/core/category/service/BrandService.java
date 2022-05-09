package cn.bootx.goods.core.category.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.dao.BrandManager;
import cn.bootx.goods.core.category.entity.Brand;
import cn.bootx.goods.dto.brand.BrandDto;
import cn.bootx.goods.param.category.BrandParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 品牌
 * @author xxm
 * @date 2022-05-09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BrandService {
    private final BrandManager brandManager;

    /**
     * 添加
     */
    public BrandDto add(BrandParam param){
        Brand brand = Brand.init(param);
        return brandManager.save(brand).toDto();
    }

    /**
     * 修改
     */
    public BrandDto update(BrandParam param){
        Brand brand = brandManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,brand, CopyOptions.create().ignoreNullValue());
        return brandManager.updateById(brand).toDto();
    }

    /**
     * 分页
     */
    public PageResult<BrandDto> page(PageParam pageParam,BrandParam brandParam){
        return MpUtil.convert2DtoPageResult(brandManager.page(pageParam,brandParam));
    }

    /**
     * 获取单条
     */
    public BrandDto findById(Long id){
        return brandManager.findById(id).map(Brand::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<BrandDto> findAll(){
        return ResultConvertUtil.dtoListConvert(brandManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        brandManager.deleteById(id);
    }

}