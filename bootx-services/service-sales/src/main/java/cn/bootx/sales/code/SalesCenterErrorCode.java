
package cn.bootx.sales.code;

/**   
* 错误码定义类
* @author xxm  
* @date 2020/10/11 
*/
public interface SalesCenterErrorCode {

    /**
     * 策略计算错误
     */
    int STRATEGY_CALCULATE_ERROR = 23010;

    /**
     * 策略已使用不可修改
     */
    int STRATEGY_ALREADY_USED = 23011;

    /**
     * 策略注册信息已存在
     */
    int STRATEGY_REGISTER_ALREADY_EXIST = 23012;

    /**
     * 策略类型错误
     */
    int STRATEGY_TYPE_ERROR = 23013;

    /**
     * 策略不存在
     */
    int STRATEGY_NOT_EXIST = 23014;

    /**
     * 渠道端已经被使用
     */
    int CLIENT_ALREADY_USED = 23016;

    /**
     * 渠道端不存在
     */
    int CLIENT_NOT_FOUND = 23017;

    /**
     * ID不存在
     */
    int ID_NOT_EXISTS = 23018;

    /**
     * 渠道已存在
     */
    int CHANNEL_ALREADY_EXISTS = 23019;

    /**
     * 优惠券领取异常
     */
    int COUPON_OBTAIN_EXCEPTION = 23020;

    /**
     * 优惠券使用异常
     */
    int COUPON_USE_EXCEPTION = 23021;

}
