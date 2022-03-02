package cn.bootx.payment.core.refund.service;

import cn.bootx.payment.core.refund.dao.RefundRecordManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 退款
* @author xxm  
* @date 2022/3/2 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class RefundRecordService {
    private final RefundRecordManager refundRecordManager;
}
