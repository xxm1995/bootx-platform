package cn.bootx.sales.code;

/**
* 优惠券状态
* @author xxm
* @date 2020/12/1
*/
public interface CouponStatusCode {
    /** 正常可用 */
    int STATUS_NORMAL = 1;
    /** 冻结 */
    int STATUS_FREEZE = 2;
    /** 已使用 */
    int STATUS_USED = 3;
    /** 已过期 */
    int STATUS_EXPIRED = 4;
    /** 已撤销 */
    int STATUS_REVOKE = 5;
}
