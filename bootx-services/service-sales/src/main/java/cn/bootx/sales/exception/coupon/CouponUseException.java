package cn.bootx.sales.exception.coupon;

import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.sales.code.SalesCenterErrorCode.COUPON_USE_EXCEPTION;

/**   
* 使用优惠券异常
* @author xxm  
* @date 2020/12/1 
*/
public class CouponUseException extends BizException implements Serializable {
    public CouponUseException(){
        super(COUPON_USE_EXCEPTION,"使用优惠券异常");
    }

    public CouponUseException(String msg){
        super(COUPON_USE_EXCEPTION,msg);
    }
}
