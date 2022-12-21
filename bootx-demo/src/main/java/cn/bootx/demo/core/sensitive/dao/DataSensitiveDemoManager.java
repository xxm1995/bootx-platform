package cn.bootx.demo.core.sensitive.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.demo.core.sensitive.entity.DataSensitiveDemo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * @author xxm
 * @date 2022/3/24
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class DataSensitiveDemoManager extends BaseManager<DataSensitiveDemoMapper, DataSensitiveDemo> {

}
