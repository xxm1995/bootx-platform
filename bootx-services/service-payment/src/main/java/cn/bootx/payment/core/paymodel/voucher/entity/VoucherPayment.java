package cn.bootx.payment.core.paymodel.voucher.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.payment.core.paymodel.base.entity.BasePayment;
import cn.bootx.payment.core.paymodel.voucher.convert.VoucherConvert;
import cn.bootx.payment.dto.paymodel.voucher.VoucherPaymentDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 储值卡支付记录
* @author xxm  
* @date 2022/3/14 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pc_voucher_payment")
public class VoucherPayment extends BasePayment implements EntityBaseFunction<VoucherPaymentDto> {


    @Override
    public VoucherPaymentDto toDto() {
        return VoucherConvert.CONVERT.convert(this);
    }
}
