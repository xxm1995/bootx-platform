package cn.bootx.payment.core.paymodel.voucher.service;

import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.voucher.dao.VoucherManager;
import cn.bootx.payment.core.paymodel.voucher.entity.Voucher;
import cn.bootx.payment.exception.payment.PayFailureException;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.paymodel.voucher.VoucherPayParam;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONException;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author xxm
 * @date 2022/3/14
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class VoucherPayService {

    private final VoucherManager voucherManager;

    /**
     * 检查
     */
    public List<Voucher> getAndCheckVoucher(PayModeParam payModeParam){
        VoucherPayParam voucherPayParam;
        try {
            // 支付宝参数验证
            String extraParamsJson = payModeParam.getExtraParamsJson();
            if (StrUtil.isNotBlank(extraParamsJson)){
                voucherPayParam = JSONUtil.toBean(extraParamsJson, VoucherPayParam.class);
            } else {
                throw new PayFailureException("");
            }
        } catch (JSONException e) {
            throw new PayFailureException("储值卡支付参数错误");
        }

        List<String> cardNoList = voucherPayParam.getCardNoList();
        List<Voucher> vouchers = voucherManager.findByCardNoList(cardNoList);
        // 判断是否有重复or无效的储值卡
        if (vouchers.size()!=cardNoList.size()){
            throw new PayFailureException("储值卡支付参数错误");
        }
        // 判断有效期
        boolean timeCheck = vouchers.stream()
                .allMatch(voucher -> LocalDateTimeUtil.between(LocalDateTime.now(),voucher.getStartTime(),voucher.getEndTime()));
        if (!timeCheck){
            throw new PayFailureException("储值卡不再有效期内");
        }
        // 金额是否满足
        BigDecimal amount = vouchers.stream().map(Voucher::getBalance)
                .reduce(BigDecimal::add)
                .orElse(BigDecimal.ZERO);
        if (BigDecimalUtil.compareTo(amount,payModeParam.getAmount())<0){
            throw new PayFailureException("储值卡余额不足");
        }

        return vouchers;
    }

    /**
     * 支付
     */
    public void pay(BigDecimal amount, Payment payment, List<Voucher> vouchers){
        // 排序,金额小的在前
        vouchers.sort((o1, o2) -> BigDecimalUtil.compareTo(o1.getBalance(),o2.getBalance()));

        for (Voucher voucher : vouchers) {
            BigDecimal balance = voucher.getBalance();
            // 待支付额大于储值卡余额. 全扣光
            if (BigDecimalUtil.compareTo(amount,balance)==1){
                amount = amount.subtract(balance);
                voucher.setBalance(BigDecimal.ZERO);
            } else {
                voucher.setBalance(balance.subtract(amount));
            }
        }
        voucherManager.updateAllById(vouchers);
    }

}
