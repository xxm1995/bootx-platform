package cn.bootx.baseapi.core.region.dao;

import cn.bootx.baseapi.core.region.entity.Village;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 村庄/社区
 * @author xxm
 * @date 2023/2/3
 */
@Repository
@RequiredArgsConstructor
public class VillageManager extends BaseManager<VillageMapper, Village> {
}
