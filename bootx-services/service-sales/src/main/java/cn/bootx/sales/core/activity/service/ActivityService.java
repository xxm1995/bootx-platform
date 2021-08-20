package cn.bootx.sales.core.activity.service;

import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.code.StrategyRegisterCode;
import cn.bootx.sales.core.activity.dao.ActivityManager;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.strategy.service.StrategyRegisterService;
import cn.bootx.sales.dto.activity.ActivityDto;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import cn.bootx.sales.param.activity.ActivityParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 策略活动处理类
 * @author xxm
 * @date 2021/2/20
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ActivityService {
    private final StrategyRegisterService strategyRegisterService;
    private final ActivityManager activityManager;

    /**
     * 添加优惠活动
     */
    public ActivityDto addByActivity(ActivityParam param) {
        // 设置活动的策略注册属性
        param.setStrategyType(StrategyRegisterCode.STRATEGY_TYPE_ACTIVITY);
        param.getCheckRules().forEach(checkRuleParam -> checkRuleParam.setRuleType(CheckRuleCode.RULE_TYPE_ACTIVITY_CHECK));

        StrategyRegisterDto strategyRegisterDto = strategyRegisterService.add(param);

        Activity activity = Activity.init(param);
        activity.setStrategyRegisterId(strategyRegisterDto.getId());
        activityManager.save(activity);
        return activity.toDto();
    }

    /**
     * 查询全部
     */
    public List<ActivityDto> findAll() {
        return null;
    }

    /**
     * 查询详情
     */
    public ActivityDto get(Long id) {
        return null;
    }
}
