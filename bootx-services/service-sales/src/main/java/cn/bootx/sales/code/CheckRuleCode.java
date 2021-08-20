package cn.bootx.sales.code;

/**
 *
 * @author xxm
 * @date 2021/5/8
 */
public interface CheckRuleCode {

    /** 活动策略类型 */
    int RULE_ACTIVITY = StrategyCode.ACTIVITY;

    /** 优惠券类型 */
    int RULE_COUPON = StrategyCode.COUPON;

    /* 检查类型规则 */
    /** 活动使用检查 */
    int RULE_TYPE_ACTIVITY_CHECK = 1;

    /** 优惠券使用检查 */
    int RULE_TYPE_COUPON_CHECK = 2;

    /** 优惠券领取检查 */
    int RULE_TYPE_COUPON_OBTAIN = 3;

    interface Activity {
        /** 渠道检查 */
        String CHECK_CHANNEL = "activityCheckChannel";

    }

    interface Coupon {

        /** 渠道检查 */
        String CHECK_CHANNEL = "couponCheckChannel";

        /** 是否支持多个同时使用 */
        String CHECK_USE_MULTIPLE = "couponCheckUseMultiple";

        /** 是否支持领取多张 */
        String OBTAIN_MULTIPLE = "obtainMultiple";

        /** 领取时渠道限制 */
        String OBTAIN_CHANNEL_LIMIT = "obtainChannelLimit";

        /** 领取时间限制 */
        String OBTAIN_TIME_LIMIT = "obtainTimeLimit";

        /** 领取张数限制 */
        String OBTAIN_NUM_LIMIT = "obtainNumLimit";

    }
}
