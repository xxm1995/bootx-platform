package cn.bootx.payment.core.paymodel.voucher.service;

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
                .allMatch(voucher -> true);
        if (!timeCheck){
            throw new PayFailureException("储值卡不再有效期内");
        }
        return vouchers;

    }
}
