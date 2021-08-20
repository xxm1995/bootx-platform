package cn.bootx.sales.exception.coupon;

import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.sales.code.SalesCenterErrorCode.COUPON_USE_EXCEPTION;

/**   
* 领取优惠券异常
* @author xxm  
* @date 2020/12/1 
*/
public class CouponObtainException extends BizException implements Serializable {
    public CouponObtainException(){
        super(COUPON_USE_EXCEPTION,"领取优惠券异常");
    }

    public CouponObtainException(String msg){
        super(COUPON_USE_EXCEPTION,msg);
    }
}
