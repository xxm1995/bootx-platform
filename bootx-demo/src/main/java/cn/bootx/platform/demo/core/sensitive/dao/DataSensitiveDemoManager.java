package cn.bootx.platform.demo.core.sensitive.dao;

import cn.bootx.platform.demo.core.sensitive.entity.DataSensitiveDemo;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * @author xxm
 * @since 2022/3/24
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class DataSensitiveDemoManager extends BaseManager<DataSensitiveDemoMapper, DataSensitiveDemo> {

}
