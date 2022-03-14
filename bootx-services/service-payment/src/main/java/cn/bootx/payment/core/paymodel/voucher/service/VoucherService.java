package cn.bootx.payment.core.paymodel.voucher.service;

import cn.bootx.payment.code.paymodel.VoucherCode;
import cn.bootx.payment.core.paymodel.voucher.dao.VoucherManager;
import cn.bootx.payment.core.paymodel.voucher.entity.Voucher;
import cn.bootx.payment.param.paymodel.voucher.VoucherGenerationParam;
import cn.bootx.payment.param.paymodel.voucher.VoucherImportParam;
import cn.hutool.core.util.IdUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**   
* 储值卡
* @author xxm  
* @date 2022/3/14 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class VoucherService {
    private final VoucherManager voucherManager;

    /**
     * 批量生成
     */
    @Transactional(rollbackFor = Exception.class)
    public void generationBatch(VoucherGenerationParam param){
        Integer count = param.getCount();
        List<Voucher> vouchers = new ArrayList<>(count);
        long batchNo = IdUtil.getSnowflakeNextId();
        for (int i = 0; i < count; i++) {
            Voucher voucher = new Voucher()
                    .setCardNo('V'+IdUtil.getSnowflakeNextIdStr())
                    .setBatchNo(batchNo)
                    .setBalance(param.getFaceValue())
                    .setFaceValue(param.getFaceValue())
                    .setEnduring(param.getEnduring())
                    .setStatus(param.getStatus());
            if (Objects.equals(param.getEnduring(),Boolean.FALSE)){
                voucher.setStartTime(param.getStartTime())
                        .setEndTime(param.getEndTime());
            }
            vouchers.add(voucher);
        }
        voucherManager.saveAll(vouchers);
    }


    /**
     * 批量导入
     */
    public void importBatch(VoucherImportParam param){
        
    }

    /**
     * 启用
     */
    public void unlock(Long id){
        voucherManager.changeStatus(id, VoucherCode.STATUS_NORMAL);
    }

    /**
     * 冻结
     */
    public void lock(Long id){
        voucherManager.changeStatus(id, VoucherCode.STATUS_FORBIDDEN);
    }
    /**
     * 批量启用
     */
    public void unlockBatch(List<Long> ids){
        voucherManager.changeStatusBatch(ids, VoucherCode.STATUS_NORMAL);
    }

    /**
     * 批量冻结
     */
    public void lockBatch(List<Long> ids){
        voucherManager.changeStatusBatch(ids, VoucherCode.STATUS_FORBIDDEN);
    }

    /**
     * 更改有效期
     */
    public void changeEnduring(){
        
    }
}
