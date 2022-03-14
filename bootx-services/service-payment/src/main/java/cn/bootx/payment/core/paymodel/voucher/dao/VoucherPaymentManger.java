package cn.bootx.payment.core.paymodel.voucher.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.payment.core.paymodel.voucher.entity.VoucherPayment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
*
* @author xxm
* @date 2022/3/14
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class VoucherPaymentManger extends BaseManager<VoucherPaymentMapper, VoucherPayment> {
}
