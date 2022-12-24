package cn.bootx.baseapi.core.region.service;

import cn.bootx.baseapi.core.region.dao.AreaManager;
import cn.bootx.baseapi.core.region.dao.CityManager;
import cn.bootx.baseapi.core.region.dao.ProvinceManager;
import cn.bootx.baseapi.core.region.dao.StreetManager;
import cn.bootx.baseapi.core.region.entity.Area;
import cn.bootx.baseapi.core.region.entity.City;
import cn.bootx.baseapi.core.region.entity.Province;
import cn.bootx.baseapi.core.region.entity.Street;
import cn.bootx.baseapi.dto.region.RegionDto;
import cn.bootx.common.core.util.TreeBuildUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static cn.bootx.baseapi.code.CachingCode.CHINA_REGION;

/**
 * 中国行政区划
 * @author xxm
 * @date 2022/12/24
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ChinaRegionService {
    private final ProvinceManager provinceManager;
    private final CityManager cityManager;
    private final AreaManager areaManager;
    private final StreetManager streetManager;

    /**
     * 根据区划级别和上级区划代码获取当前行政区划的列表
     */
    @Cacheable(value = CHINA_REGION, key = "#pid+':'+#level")
    public List<RegionDto> findAllRegionByPid(Integer pid, Integer level){
        if(level == 2){
            return cityManager.findAllByPid(pid).stream().map(City::toDto).collect(Collectors.toList());
        } else if(level == 3){
            return areaManager.findAllByPid(pid).stream().map(Area::toDto).collect(Collectors.toList());
        } else if(level == 4){
            return streetManager.findAllByPid(pid).stream().map(Street::toDto).collect(Collectors.toList());
        } else {
            return new ArrayList<>(0);
        }
    }


    /**
     * 获取一级行政区
     */
    @Cacheable(value = CHINA_REGION, key = "'p'")
    public List<RegionDto> findAllProvince(){
        return provinceManager.findAll().stream()
                .map(Province::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 获取省市联动列表
     */
    @Cacheable(value = CHINA_REGION, key = "'pc'")
    public List<RegionDto> findAllProvinceAndCity(){
        List<RegionDto> provinceList = provinceManager.findAll().stream().map(Province::toDto).collect(Collectors.toList());
        List<RegionDto> regionList = cityManager.findAll().stream().map(City::toDto).collect(Collectors.toList());
        List<RegionDto> regions = new ArrayList<>(regionList.size()+regionList.size());
        regions.addAll(provinceList);
        regions.addAll(regionList);
        // 构建树
        return TreeBuildUtil.build(regions,null,RegionDto::getId,RegionDto::getPid,RegionDto::setChildren);
    }
    /**
     * 获取省市区县联动列表
     */
    @Cacheable(value = CHINA_REGION, key = "'pca'")
    public List<RegionDto> findAllProvinceAndCityAndArea(){
        List<RegionDto> provinceList = provinceManager.findAll().stream().map(Province::toDto).collect(Collectors.toList());
        List<RegionDto> regionList = cityManager.findAll().stream().map(City::toDto).collect(Collectors.toList());
        List<RegionDto> areaList = areaManager.findAll().stream().map(Area::toDto).collect(Collectors.toList());
        List<RegionDto> regions = new ArrayList<>(regionList.size()+regionList.size()+areaList.size());
        regions.addAll(provinceList);
        regions.addAll(regionList);
        regions.addAll(areaList);

        // 构建树
        return TreeBuildUtil.build(regions,null,RegionDto::getId,RegionDto::getPid,RegionDto::setChildren);
    }

}
