package cn.bootx.sales.code;

/**   
* 策略注册相关常量
* @author xxm  
* @date 2020/11/8 
*/
public interface StrategyRegisterCode {

    /**
     * 策略类型 活动
     */
    int STRATEGY_TYPE_ACTIVITY = StrategyCode.ACTIVITY;

    /**
     * 策略类型 优惠券
     */
    int STRATEGY_TYPE_COUPON = StrategyCode.COUPON;

    /**
     * 策略状态
     */
    int STATE_NORMAL = 1;
    int STATE_NOT_ACTIVE = 0;

    /**
     * 策略激活状态
     */
    int ACTIVE_YES = 1;
    int ACTIVE_NO = 0;
}
