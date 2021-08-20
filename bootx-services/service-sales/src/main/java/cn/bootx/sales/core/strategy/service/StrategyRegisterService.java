package cn.bootx.sales.core.strategy.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.core.check.config.dao.CheckRuleManager;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.match.dao.MatchRuleManager;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.core.strategy.dao.*;
import cn.bootx.sales.core.strategy.entity.StrategyConfig;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import cn.bootx.sales.exception.strategy.StrategyNotExistException;
import cn.bootx.sales.param.strategy.CheckRuleParam;
import cn.bootx.sales.param.strategy.MatchRuleParam;
import cn.bootx.sales.param.strategy.StrategyConfigValueParam;
import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 策略注册
 * @author xxm
 * @date 2020/10/11
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class StrategyRegisterService {
    private final StrategyRegisterManager strategyRegisterManager;

    private final StrategyManager strategyManager;
    private final StrategyConfigValueManager strategyConfigValueManager;
    private final StrategyConfigManager strategyConfigManager;

    private final CheckRuleManager checkRuleManager;
    private final MatchRuleManager matchRuleManager;

    /**
     * 新增策略注册
     */
    @Transactional(rollbackFor = Exception.class)
    public StrategyRegisterDto add(StrategyRegisterParam param){
        StrategyRegister strategyRegister = this.build(param);
        strategyRegister = strategyRegisterManager.save(strategyRegister);

        // 保存匹配规则
        this.addCheckMatch(param.getMatchRules(),strategyRegister);
        // 保存检查规则
        this.addCheckRules(param.getCheckRules(),strategyRegister);
        // 保存策略参数值
        this.addConfigValue(strategyRegister.getStrategyId(),strategyRegister.getId(),param.getConfigValues());
        return strategyRegister.toDto();
    }


    /**
     * 建立策略注册
     */
    public StrategyRegister build(StrategyRegisterParam param){
        StrategyRegister strategyRegister = StrategyRegister.init(param);
        boolean strategyExist = strategyManager.existsById(param.getStrategyId());
        if (!strategyExist){
            throw new StrategyNotExistException();
        }
        return strategyRegister;
    }

    /**
     * 添加匹配规则
     */
    private void addCheckMatch(List<MatchRuleParam> matchRules, StrategyRegister strategyRegister) {
        List<MatchRuleConfig> checkMatches = matchRules
                .stream()
                .map(rule -> MatchRuleConfig.init(rule)
                        .setRegisterType(strategyRegister.getStrategyType())
                        .setStrategyRegisterId(strategyRegister.getId())
                ).collect(Collectors.toList());
        matchRuleManager.saveAll(checkMatches);
    }

    /**
     * 添加检查规则
     */
    private void addCheckRules(List<CheckRuleParam> checkRules, StrategyRegister strategyRegister) {
        if (CollUtil.isEmpty(checkRules)){
            return;
        }
        List<CheckRuleConfig> rules = checkRules.stream()
                .map(rule -> CheckRuleConfig.init(rule)
                        .setRegisterType(strategyRegister.getStrategyType())
                        .setStrategyRegisterId(strategyRegister.getId()))
                .collect(Collectors.toList());
        checkRuleManager.saveAll(rules);
    }

    /**
     * 策略配置处理
     */
    private void addConfigValue(Long strategyId, Long strategyRegisterId, List<StrategyConfigValueParam> configValues) {
        if (!CollectionUtil.isEmpty(configValues)) {
            List<StrategyConfigValue> strategyConfigValues = new ArrayList<>();
            configValues.forEach(configValue -> {
                StrategyConfig strategyConfig = strategyConfigManager.findById(configValue.getStrategyConfigId())
                        .orElseThrow(() -> new BizException("策略配置不存在"));
                StrategyConfigValue strategyConfigValue = StrategyConfigValue.init(configValue)
                        .setKey(strategyConfig.getKey())
                        .setStrategyRegisterId(strategyRegisterId)
                        .setStrategyId(strategyId);

                strategyConfigValues.add(strategyConfigValue);
            });
            strategyConfigValueManager.saveAll(strategyConfigValues);
        }
    }

    /**
     * 查询全部策略注册信息
     */
    public List<StrategyRegisterDto> findAll(){
        List<StrategyRegister> all = strategyRegisterManager.findAll();
        return all.stream()
                .map(StrategyRegister::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 删除策略注册
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteById(Long id){
        if (strategyRegisterManager.existsById(id)){
            // 删除策略
            strategyManager.deleteById(id);
            // 删除策略配置信息
            strategyConfigValueManager.deleteByStrategyRegisterId(id);
        }
    }
}
