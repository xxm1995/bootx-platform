package cn.bootx.sales.code;

/**   
* 策略code
* @author xxm  
* @date 2021/3/10 
*/
public interface StrategyCode {

    /** 系统内置 */
    int ENGINE_SYSTEM = 1;
    /** JavaScript引擎 */
    int ENGINE_JAVASCRIPT = 2;
    /** Groovy引擎 */
    int ENGINE_GROOVY = 3;

    /** 活动策略 */
    int ACTIVITY = 1;
    /** 优惠券 */
    int COUPON = 2;

    /** 计算 */
    int TARGET_TYPE_CALCULATE = 1;
    /** 匹配 */
    int TARGET_TYPE_MATCH = 2;
    /** 检查 */
    int TARGET_TYPE_CHECK = 3;


}
