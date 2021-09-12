package cn.bootx.payment.core.payment.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.param.payment.PaymentQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class PaymentManager extends BaseManager<PaymentMapper, Payment> {

    /**
     * 按业务ID顺序按创建时间Desc查找非取消的支付单
     */
    public List<Payment> findByBusinessIdNoCancelDesc(String businessId) {
        // "FROM Payment WHERE businessId = ?1 AND payStatus  ?2 order by createTime description"

        return lambdaQuery()
                .eq(Payment::getBusinessId,businessId)
                .notIn(Payment::getPayStatus,PayStatusCode.TRADE_CANCEL)
                .orderByDesc(Payment::getCreateTime)
                .list();
    }

    /**
     * 按业务ID顺序按创建时间Desc查找的支付单
     */
    public List<Payment> findByBusinessIdDesc(String businessId) {
        // "FROM Payment WHERE businessId = ?1  order by createTime description"
        return lambdaQuery()
                .eq(Payment::getBusinessId,businessId)
                .orderByDesc(Payment::getCreateTime)
                .list();
    }

    /**
     * 根据用户查询
     */
    public List<Payment> findByUserId(Long userId){
        return this.findAllByField(Payment::getUserId,userId);
    }

    public Page<Payment> page(PageParam pageParam, PaymentQuery param) {
        Page<Payment> mpPage = MpUtils.getMpPage(pageParam, Payment.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getCreateTime)
                .page(mpPage);
    }

}
