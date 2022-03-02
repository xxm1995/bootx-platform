package cn.bootx.payment.core.refund.service;

import cn.bootx.payment.core.refund.dao.RefundRecordManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class RefundRecordService {
    private final RefundRecordManager refundRecordManager;
}
