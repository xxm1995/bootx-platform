package cn.bootx.sales.core.strategy.dao;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
@RequiredArgsConstructor
public class StrategyRegisterManager extends BaseManager<StrategyRegisterMapper,StrategyRegister> {

    /**
     * 策略注册是否存在
     */
    public boolean existsById(Long id){
        return existedByField(MpBaseEntity::getId,id);
    }
}
