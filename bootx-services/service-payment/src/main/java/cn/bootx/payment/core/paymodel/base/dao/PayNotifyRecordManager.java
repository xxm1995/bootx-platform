package cn.bootx.payment.core.paymodel.base.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.payment.core.paymodel.base.entity.PayNotifyRecord;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * 支付记录
 * @author xxm
 * @date 2021/6/22
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class PayNotifyRecordManager extends BaseManager<PayNotifyRecordMapper,PayNotifyRecord> {

    public Page<PayNotifyRecord> page(PageParam pageParam){
        Page<PayNotifyRecord> mpPage = MpUtils.getMpPage(pageParam, PayNotifyRecord.class);
        return lambdaQuery().page(mpPage);
    }
}
