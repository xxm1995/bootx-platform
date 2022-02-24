package cn.bootx.payment.core.notify.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.payment.core.notify.entity.PayNotifyRecord;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * 支付消息通知回调
 * @author xxm
 * @date 2021/6/22
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class PayNotifyRecordManager extends BaseManager<PayNotifyRecordMapper, PayNotifyRecord> {

    public Page<PayNotifyRecord> page(PageParam pageParam){
        Page<PayNotifyRecord> mpPage = MpUtil.getMpPage(pageParam, PayNotifyRecord.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }
}
