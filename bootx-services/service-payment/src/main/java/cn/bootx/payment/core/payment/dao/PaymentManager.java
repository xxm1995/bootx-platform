package cn.bootx.payment.core.payment.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.common.query.entity.QueryParams;
import cn.bootx.common.query.generator.QueryGenerator;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.param.payment.PaymentQuery;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

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
                .orderByDesc(Payment::getId)
                .list();
    }

    /**
     * 按业务ID顺序按创建时间Desc查找的支付单
     */
    public List<Payment> findByBusinessIdDesc(String businessId) {
        // "FROM Payment WHERE businessId = ?1  order by createTime description"
        return lambdaQuery()
                .eq(Payment::getBusinessId,businessId)
                .orderByDesc(Payment::getId)
                .list();
    }

    /**
     * 根据用户查询
     */
    public List<Payment> findByUserId(Long userId){
        return this.findAllByField(Payment::getUserId,userId);
    }

    /**
     * 分页查询
     */
    public Page<Payment> page(PageParam pageParam, PaymentQuery param) {
        Page<Payment> mpPage = MpUtil.getMpPage(pageParam, Payment.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .like(Objects.nonNull(param.getPaymentId()),Payment::getId,param.getPaymentId())
                .like(Objects.nonNull(param.getBusinessId()),Payment::getBusinessId,param.getBusinessId())
                .like(Objects.nonNull(param.getTitle()),Payment::getTitle,param.getTitle())
                .page(mpPage);
    }
    /**
     * 分页查询
     */
    public Page<Payment> superPage(PageParam pageParam, QueryParams queryParams) {
        QueryWrapper<Payment> wrapper = QueryGenerator.generator(queryParams);
        Page<Payment> mpPage = MpUtil.getMpPage(pageParam, Payment.class);
        return this.page(mpPage,wrapper);
    }

}
