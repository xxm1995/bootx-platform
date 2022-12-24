package cn.bootx.baseapi.core.region.dao;

import cn.bootx.baseapi.core.region.entity.City;
import cn.bootx.baseapi.core.region.entity.Province;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 省份表
 * @author xxm
 * @date 2022-12-24
 */
@Repository
@RequiredArgsConstructor
public class ProvinceManager extends BaseManager<ProvinceMapper, Province> {


}
