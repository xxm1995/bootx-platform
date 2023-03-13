package cn.bootx.baseapi.core.region.dao;

import cn.bootx.baseapi.core.region.entity.City;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 城市表
 *
 * @author xxm
 * @date 2022-12-24
 */
@Mapper
public interface CityMapper extends BaseMapper<City> {

}
