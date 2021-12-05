package cn.bootx.payment.core.payment.service;

import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import cn.bootx.payment.dto.payment.PaymentDto;
import cn.bootx.payment.param.payment.PaymentQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 支付单查询
 * @author xxm
 * @date 2021/6/28
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentQueryService {
    private final PaymentManager paymentManager;

    /**
     * 根据支付Id查询支付单
     */
    public PaymentDto findById(Long id){
        return paymentManager.findById(id)
                .map(Payment::toDto)
                .orElse(null);
    }

    /**
     * 根据业务ID获取成功记录
     */
    public List<PaymentDto> findByBusinessId(String businessId){
        return paymentManager.findByBusinessIdDesc(businessId).stream()
                .map(Payment::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 根据businessId获取订单支付方式
     */
    public List<PayChannelInfo> findPayTypeInfoByBusinessId(String businessId){
        List<Payment> payments = paymentManager.findByBusinessIdDesc(businessId);
        return payments.stream()
                .findFirst()
                .map(Payment::getPayTypeInfos)
                .orElse(new ArrayList<>(1));
    }

    /**
     * 根据id获取订单支付方式
     */
    public List<PayChannelInfo> findPayTypeInfoById(Long id){
        return paymentManager.findById(id)
                .map(Payment::getPayTypeInfos)
                .orElse(new ArrayList<>(1));
    }

    /**
     * 根据用户id查询
     */
    public List<PaymentDto> findByUser(Long userId){
        return paymentManager.findByUserId(userId).stream()
                .map(Payment::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 分页
     */
    public PageResult<PaymentDto> page(PageParam pageParam, PaymentQuery param){
        return MpUtil.convert2PageResult(paymentManager.page(pageParam,param));
    }
}
