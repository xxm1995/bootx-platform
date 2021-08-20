package cn.bootx.sales.core.calculate.code;

import cn.bootx.sales.dto.strategy.StrategyConfigDto;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 内置java原生计算类相关常量
 * @author xxm
 * @date 2021/4/14
 */
public interface JavaCalculateCode {

    /** 立减 */
    String INSTANT_REDUCTION = "instantReduction";
    /** 满减 */
    String FULL_REDUCTION = "fullReduction";

    /**
     * 立减
     */
    @Getter
    @AllArgsConstructor
    enum InstantReduction{
        /** 配置立减的字段 */
        AMOUNT("amount","立减金额", BigDecimal.class.getSimpleName());

        private final String key;
        private final String name;
        private final String type;

        public static List<StrategyConfigDto> find(){
            return Arrays.stream(InstantReduction.values())
                    .map(e -> new StrategyConfigDto()
                            .setKey(e.key)
                            .setName(e.name)
                            .setType(e.type))
                    .collect(Collectors.toList());
        }
    }

    /**
     * 满减
     */
    @Getter
    @AllArgsConstructor
    enum FullReduction{
        /** 配置满多少的字段 */
        SATISFY ("satisfy","满多少",BigDecimal.class.getSimpleName()),

        /** 配置减多少的字段 */
        MINUS("minus","减多少",BigDecimal.class.getSimpleName());
        private final String key;
        private final String name;
        private final String type;

        public static List<StrategyConfigDto> find(){
            return Arrays.stream(FullReduction.values())
                    .map(e -> new StrategyConfigDto()
                            .setKey(e.key)
                            .setName(e.name)
                            .setType(e.type))
                    .collect(Collectors.toList());
        }
    }
}
