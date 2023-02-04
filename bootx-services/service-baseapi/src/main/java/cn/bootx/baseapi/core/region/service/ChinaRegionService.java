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
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.listener.PageReadListener;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.fastjson.JSON;
import lombok.*;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.zip.ZipInputStream;

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
     * 导入文件 格式为压缩包
     */
    @SneakyThrows
    public void importCsv(MultipartFile file){
        try (ZipInputStream zis = new ZipInputStream(file.getInputStream())) {
            EasyExcel.read("C://data/provinces.csv", ProvinceCsv.class,new PageReadListener<ProvinceCsv>(dataList -> {
                for (val demoData : dataList) {
                    log.info("读取到一条数据{}", JSON.toJSONString(demoData));
                }
            })).excelType(ExcelTypeEnum.CSV).sheet().doRead();
        }
    }


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
        return TreeBuildUtil.build(regions,null,RegionDto::getCode,RegionDto::getParentCode,RegionDto::setChildren);
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
        return TreeBuildUtil.build(regions,null,RegionDto::getCode,RegionDto::getParentCode,RegionDto::setChildren);
    }

    /**
     * 省份表导入
     * easyExcel要求不可以Setter返回值必须为void
     */
    @Getter
    @Setter
    @Accessors(chain = false)
    public static class ProvinceCsv{
        private String code;
        private String name;
        private String provinceCode;
    }
    /**
     * 城市表导入
     */
    @Getter
    @Setter
    @Accessors(chain = false)
    public static class CityCsv{
        private String code;
        private String name;
        private String provinceCode;
    }
    /**
     * 区域表(县区)导入
     */
    @Getter
    @Setter
    @Accessors(chain = false)
    public static class AreaCsv{
        private String code;
        private String name;
        private String cityCode;
    }
    /**
     * 街道/乡镇表导入
     */
    @Getter
    @Setter
    @Accessors(chain = false)
    public static class StreetCsv{
        private String code;
        private String name;
        private String areaCode;
    }
    /**
     * 街道/乡镇表导入
     */
    @Getter
    @Setter
    @Accessors(chain = false)
    public static class VillageCsv{
        private String code;
        private String name;
        private String streetCode;
    }

}
