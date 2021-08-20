package cn.bootx.sales.core.activity.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.activity.entity.Activity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**   
* 优惠活动
* @author xxm  
* @date 2021/5/7 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class ActivityManager extends BaseManager<ActivityMapper,Activity> {

    /**
     * 根据策略注册ids查询
     */
    public List<Activity> findByStrategyRegister(List<Long> strategyRegisterIds){
        return findAllByFields(Activity::getStrategyRegisterId,strategyRegisterIds);
    }
}
