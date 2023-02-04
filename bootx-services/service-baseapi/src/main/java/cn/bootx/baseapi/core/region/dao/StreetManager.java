package cn.bootx.baseapi.core.region.dao;

import cn.bootx.baseapi.core.region.entity.Street;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 街道表
 * @author xxm
 * @date 2022-12-24
 */
@Repository
@RequiredArgsConstructor
public class StreetManager extends BaseManager<StreetMapper, Street> {

    public List<Street> findAllByPid(Integer pid){
        return findAllByField(Street::getAreaCode,pid);
    }
}
