package cn.bootx.payment.core.paymodel.voucher.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.payment.core.paymodel.voucher.entity.VoucherLog;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
*
* @author xxm
* @date 2022/3/19
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class VoucherLogManager extends BaseManager<VoucherLogMapper, VoucherLog> {
}
