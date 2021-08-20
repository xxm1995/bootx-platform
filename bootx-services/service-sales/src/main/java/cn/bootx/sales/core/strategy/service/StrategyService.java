package cn.bootx.sales.core.strategy.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.sales.core.strategy.dao.StrategyConfigManager;
import cn.bootx.sales.core.strategy.dao.StrategyConfigValueManager;
import cn.bootx.sales.core.strategy.dao.StrategyManager;
import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.bootx.sales.core.strategy.entity.StrategyConfig;
import cn.bootx.sales.dto.strategy.StrategyConfigDto;
import cn.bootx.sales.dto.strategy.StrategyDto;
import cn.bootx.sales.exception.strategy.StrategyAlreadyUsedException;
import cn.bootx.sales.exception.strategy.StrategyNotExistException;
import cn.bootx.sales.param.strategy.StrategyConfigParam;
import cn.bootx.sales.param.strategy.StrategyParam;
import cn.hutool.core.collection.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 策略
 * @author xxm
 * @date 2020/10/11
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class StrategyService {

    private final StrategyManager strategyManager;
    private final StrategyConfigManager strategyConfigManager;
    private final StrategyConfigValueManager strategyConfigValueManager;

    /**
     * 添加策略及其配置项
     */
    public StrategyDto add(StrategyParam param){
        Strategy strategy = Strategy.init(param);
        // 检查code是否重复
        if (strategyManager.existsByCode(param.getCode())){
            throw new BizException("策略code重复");
        }
        Strategy save = strategyManager.save(strategy);
        this.strategyConfigsPersistence(save.getId(), param.getConfigParams());
        return save.toDto();
    }

    /**
     * 更新策略及其配置项 如果已被注册则不允许更改  配置项及脚本程序
     */
    @Transactional(rollbackFor = Exception.class)
    public StrategyDto update(StrategyParam strategyParam){

        Long strategyId = strategyParam.getId();

        if (strategyManager.countByStrategyId(strategyId) == 0){
            Strategy strategy = Strategy.init(strategyParam);
            //删除原有配置项
            strategyManager.deleteById(strategyId);
            //如果存在配置项 则持久化配置项
            this.strategyConfigsPersistence(strategyId, strategyParam.getConfigParams());

            Strategy save = strategyManager.save(strategy);

            return save.toDto();
        } else {
            throw new StrategyAlreadyUsedException();
        }
    }

    /**
     * 查询所有的策略
     */
    public List<StrategyDto> findAll() {
        List<Strategy> strategyList = strategyManager.findAll();
        if (CollectionUtil.isEmpty(strategyList)) {
            return new ArrayList<>();
        }
        return strategyList.stream()
                .map(strategy -> {
                    StrategyDto dto = strategy.toDto();
                    dto.setRuleScript(null);
                    return dto;
                }).collect(Collectors.toList());
    }

    /**
     * 策略配置持久性
     */
    private void strategyConfigsPersistence(Long strategyId, List<StrategyConfigParam> configParams){
        if (!CollectionUtil.isEmpty(configParams)){
            List<StrategyConfig> strategyConfigs = new ArrayList<>();
            configParams.forEach(strategyConfigParam -> {
                StrategyConfig strategyConfig = StrategyConfig.init(strategyConfigParam);
                strategyConfig.setStrategyId(strategyId);
                strategyConfigs.add(strategyConfig);
            });

            strategyConfigManager.saveAll(strategyConfigs);
        }
    }
    /**
     * 删除策略及其配置项
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteById(Long strategyId){
        try {
            strategyManager.deleteById(strategyId);
            //删除原有配置项
            strategyConfigManager.deleteByStrategyId(strategyId);

            // 策略注册
            strategyManager.deleteById(strategyId);

            // 策略脚本配置项
            strategyConfigValueManager.deleteByStrategyId(strategyId);
        }catch (EmptyResultDataAccessException e) {
            log.info("策略不存在，策略ID为：{}", strategyId);
            throw new StrategyNotExistException();
        }
    }

    /**
     * 获取策略及其配置项
     */
    public StrategyDto findById(Long strategyId){
        StrategyDto strategy = strategyManager.findById(strategyId)
                .map(Strategy::toDto)
                .orElseThrow(StrategyNotExistException::new);

        List<StrategyConfig> strategyConfigs = strategyConfigManager.findByStrategyId(strategyId);
        List<StrategyConfigDto> strategyConfigDtoList = strategyConfigs.stream()
                .map(StrategyConfig::toDto)
                .collect(Collectors.toList());

        strategy.setConfigParams(strategyConfigDtoList);

        // 是否被注册使用
        if (strategyManager.countByStrategyId(strategyId) == 0){
            strategy.setUpdatable(true);
        }
        return strategy;
    }

    /**
     * 通过策略ID获取配置
     */
    public List<StrategyConfigDto> findConfigsByStrategyId(Long strategyId) {
        List<StrategyConfig> strategyConfigs = strategyConfigManager.findByStrategyId(strategyId);
        List<StrategyConfigDto> strategyConfigDtoList = new ArrayList<>();
        if(!CollectionUtil.isEmpty(strategyConfigs)) {
            strategyConfigs.forEach(strategyConfig -> strategyConfigDtoList.add(strategyConfig.toDto()));
        }
        return strategyConfigDtoList;
    }

    /**
     * 根据类型查询
     */
    public List<StrategyConfigDto> findByType(Integer type) {
        return ResultConvertUtils.dtoListConvert(strategyConfigManager.findByType(type));
    }
}
