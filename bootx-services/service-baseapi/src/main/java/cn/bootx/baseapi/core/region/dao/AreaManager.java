package cn.bootx.baseapi.core.region.dao;

import cn.bootx.baseapi.core.region.entity.Area;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 区域表
 * @author xxm
 * @date 2022-12-24
 */
@Repository
@RequiredArgsConstructor
public class AreaManager extends BaseManager<AreaMapper, Area> {

    public List<Area> findAllByPid(Integer pid){
        return findAllByField(Area::getCityCode,pid);
    }
}
