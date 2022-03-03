package cn.bootx.payment.core.refund.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.payment.core.notify.entity.PayNotifyRecord;
import cn.bootx.payment.core.refund.entity.RefundRecord;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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


    public Page<RefundRecord> page(PageParam pageParam){
        Page<RefundRecord> mpPage = MpUtil.getMpPage(pageParam, RefundRecord.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }
}
