package cn.bootx.payment.core.refund.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.payment.core.refund.entity.RefundRecord;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
*
* @author xxm  
* @date 2022/3/2 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class RefundRecordManager extends BaseManager<RefundRecordMapper, RefundRecord> {
}
