package cn.bootx.payment.core.paymodel.voucher.service;

import cn.bootx.payment.core.paymodel.voucher.dao.VoucherPaymentManger;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 储值卡支付记录
* @author xxm  
* @date 2022/3/14 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class VoucherPaymentService {
    private final VoucherPaymentManger voucherPaymentManger;
}
