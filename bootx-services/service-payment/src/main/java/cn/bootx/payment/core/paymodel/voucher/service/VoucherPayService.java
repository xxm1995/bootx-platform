package cn.bootx.payment.core.paymodel.voucher.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.payment.code.paymodel.VoucherCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.voucher.dao.VoucherLogManager;
import cn.bootx.payment.core.paymodel.voucher.dao.VoucherManager;
import cn.bootx.payment.core.paymodel.voucher.dao.VoucherPaymentManager;
import cn.bootx.payment.core.paymodel.voucher.entity.Voucher;
import cn.bootx.payment.core.paymodel.voucher.entity.VoucherLog;
import cn.bootx.payment.core.paymodel.voucher.entity.VoucherPayment;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 储值卡支付
 * @author xxm
 * @date 2022/3/14
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class VoucherPayService {

    private final VoucherManager voucherManager;
    private final VoucherPaymentManager voucherPaymentManager;
    private final VoucherLogManager voucherLogManager;

    /**
     * 获取并检查储值卡
     */
    public List<Voucher> getAndCheckVoucher(PayModeParam payModeParam) {
        VoucherPayParam voucherPayParam;
        try {
            // 支付宝参数验证
            String extraParamsJson = payModeParam.getExtraParamsJson();
            if (StrUtil.isNotBlank(extraParamsJson)) {
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
        if (vouchers.size() != cardNoList.size()) {
            throw new PayFailureException("储值卡支付参数错误");
        }
        // 判断有效期
        boolean timeCheck = vouchers.stream()
                .allMatch(voucher -> LocalDateTimeUtil.between(LocalDateTime.now(), voucher.getStartTime(), voucher.getEndTime()));
        if (!timeCheck) {
            throw new PayFailureException("储值卡不再有效期内");
        }
        // 金额是否满足
        BigDecimal amount = vouchers.stream().map(Voucher::getBalance)
                .reduce(BigDecimal::add)
                .orElse(BigDecimal.ZERO);
        if (BigDecimalUtil.compareTo(amount, payModeParam.getAmount()) < 0) {
            throw new PayFailureException("储值卡余额不足");
        }

        return vouchers;
    }

    /**
     * 支付
     */
    public void pay(BigDecimal amount, Payment payment, List<Voucher> vouchers) {
        // 排序,金额小的在前
        vouchers.sort((o1, o2) -> BigDecimalUtil.compareTo(o1.getBalance(), o2.getBalance()));
        List<VoucherLog> voucherLogs = new ArrayList<>();

        for (Voucher voucher : vouchers) {
            // 待支付余额为零, 不在处理后面的储值卡
            if (BigDecimalUtil.compareTo(amount, BigDecimal.ZERO) < 1) {
                break;
            }

            BigDecimal balance = voucher.getBalance();
            // 日志
            VoucherLog voucherLog = new VoucherLog()
                    .setPaymentId(payment.getId())
                    .setBusinessId(payment.getBusinessId())
                    .setType(VoucherCode.LOG_PAY)
                    .setVoucherId(voucher.getId())
                    .setVoucherNo(voucher.getCardNo());

            // 待支付额大于储值卡余额. 全扣光
            if (BigDecimalUtil.compareTo(amount, balance) == 1) {
                amount = amount.subtract(balance);
                voucher.setBalance(BigDecimal.ZERO);
                voucherLog.setAmount(amount);
            } else {
                voucher.setBalance(balance.subtract(amount));
                voucherLog.setAmount(voucher.getBalance());
            }
            voucherLogs.add(voucherLog);
        }
        voucherManager.updateAllById(vouchers);
        voucherLogManager.saveAll(voucherLogs);
    }

    /**
     * 取消支付
     */
    public void close(Long paymentId) {
        // 查找支付记录日志
        List<VoucherLog> voucherLogs = voucherLogManager.findByPaymentIdAndType(paymentId, VoucherCode.LOG_PAY);
        // 查出关联的储值卡
        Map<Long, VoucherLog> voucherLogMap = voucherLogs.stream().collect(Collectors.toMap(VoucherLog::getVoucherId, o -> o));
        List<Voucher> vouchers = voucherManager.findAllByIds(voucherLogMap.keySet());
        // 执行退款并记录日志
        List<VoucherLog> logs = new ArrayList<>();
        for (Voucher voucher : vouchers) {
            VoucherLog voucherLog = voucherLogMap.get(voucher.getId());
            voucher.setBalance(voucher.getBalance().add(voucherLog.getAmount()));
            VoucherLog log = new VoucherLog()
                    .setAmount(voucherLog.getAmount())
                    .setPaymentId(paymentId)
                    .setBusinessId(voucherLog.getBusinessId())
                    .setVoucherId(voucher.getId())
                    .setVoucherNo(voucher.getCardNo())
                    .setType(VoucherCode.LOG_CLOSE);
            logs.add(log);
        }
        voucherManager.updateAllById(vouchers);
        voucherLogManager.saveAll(logs);
    }

    /**
     * 退款 部分退款平均分摊到到支付使用的储值卡上
     */
    public void refund(Long paymentId, BigDecimal amount){
        VoucherPayment voucherPayment = voucherPaymentManager.findByPaymentId(paymentId).orElseThrow(() -> new BizException("储值卡支付记录不存在"));

        // 分摊比例
        BigDecimal proportion = BigDecimalUtil.divide(voucherPayment.getAmount(), amount);

        // 查找支付记录日志
        List<VoucherLog> voucherLogs = voucherLogManager.findByPaymentIdAndType(paymentId, VoucherCode.LOG_PAY);
        // 查出关联的储值卡
        Map<Long, VoucherLog> voucherLogMap = voucherLogs.stream().collect(Collectors.toMap(VoucherLog::getVoucherId, o -> o));
        List<Voucher> vouchers = voucherManager.findAllByIds(voucherLogMap.keySet());

        List<VoucherLog> logs = new ArrayList<>();

        // 已经分摊金额
        BigDecimal alreadyShareValue = BigDecimal.ZERO;
        //计算 分摊至订单细节的金额 先分摊N-1个, 剩下的分摊到最后一个
        for (int i = 0; i < vouchers.size(); i++) {
            Voucher voucher = vouchers.get(i);
            VoucherLog voucherLog = voucherLogMap.get(voucher.getId());
            // 分摊退款值
            BigDecimal priceChange;
            // 最后一个订单分摊剩余的
            if (vouchers.size() - 1 == i) {
                priceChange = BigDecimalUtil.subtract(amount, alreadyShareValue);
            } else {
                // 退款分摊金额
                priceChange = BigDecimalUtil.multiply(voucherLog.getAmount(), proportion);
                // 累加到已分摊金额上
                alreadyShareValue = BigDecimalUtil.add(alreadyShareValue, priceChange);
            }
            voucher.setBalance(voucher.getBalance().add(priceChange));
            // logs
            VoucherLog log = new VoucherLog()
                    .setAmount(priceChange)
                    .setPaymentId(paymentId)
                    .setBusinessId(voucherLog.getBusinessId())
                    .setVoucherId(voucher.getId())
                    .setVoucherNo(voucher.getCardNo())
                    .setType(VoucherCode.LOG_REFUND);
            logs.add(log);
        }
        voucherManager.updateAllById(vouchers);
        voucherLogManager.saveAll(logs);
    }

}
