package cn.bootx.payment.core.paymodel.cash.entity;

import cn.bootx.payment.core.paymodel.base.entity.BasePayment;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 现金支付记录
* @author xxm
* @date 2021/6/23
*/
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("pc_cash_payment")
@Accessors(chain = true)
public class CashPayment extends BasePayment {
}
