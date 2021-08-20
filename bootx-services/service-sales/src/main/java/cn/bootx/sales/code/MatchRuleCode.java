package cn.bootx.sales.code;

import java.util.Arrays;
import java.util.List;

/**
* 匹配策略
* @author xxm
* @date 2020/12/3
*/
public interface MatchRuleCode {

    /** 活动策略类型 */
    int MATCH_ACTIVITY = StrategyCode.ACTIVITY;
    /** 优惠券类型 */
    int MATCH_COUPON = StrategyCode.COUPON;

    /**
     * 注册类型 - SKU
     */
    int MATCH_TYPE_SKU = 1;

    /**
     * 注册类型 - 商品
     */
    int MATCH_TYPE_GOODS = 2;

    /**
     * 注册类型 - 类目
     */
    int MATCH_TYPE_CATEGORY = 3;

    /**
     * 注册类型 - 店铺
     */
    int MATCH_TYPE_SHOP = 4;

    /**
     * 注册类型 - 活动
     */
    int MATCH_TYPE_ACTIVE = 5;

    /**
     * 注册类型 - 全局适用
     */
    int MATCH_TYPE_GLOBAL = 6;

    /**
     * 注册类型 - 非虚拟商品
     */
    int MATCH_TYPE_NOT_VIRTUAL = 7;

    /**
     * 注册类型 - 排除指定SKU
     */
    int MATCH_TYPE_EXCLUDE_SKU = 11;

    /**
     * 注册类型 - 排除指定商品
     */
    int MATCH_TYPE_EXCLUDE_GOODS = 12;

    /**
     * 注册类型 - 排除指定类目
     */
    int MATCH_TYPE_EXCLUDE_CATEGORY = 13;

    List<Integer> GLOBAL_ACTIVITY = Arrays.asList(
            MATCH_TYPE_GLOBAL,
            MATCH_TYPE_NOT_VIRTUAL,
            MATCH_TYPE_EXCLUDE_SKU,
            MATCH_TYPE_EXCLUDE_GOODS,
            MATCH_TYPE_EXCLUDE_CATEGORY
    );

}
