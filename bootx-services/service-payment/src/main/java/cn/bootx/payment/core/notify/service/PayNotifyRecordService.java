package cn.bootx.payment.core.notify.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.notify.dao.PayNotifyRecordManager;
import cn.bootx.payment.core.notify.entity.PayNotifyRecord;
import cn.bootx.payment.dto.notify.PayNotifyRecordDto;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 回调记录
* @author xxm  
* @date 2021/7/5 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class PayNotifyRecordService {
    private final PayNotifyRecordManager payNotifyRecordManager;

    /**
     * 分页查询
     */
    public PageResult<PayNotifyRecordDto> page(PageParam pageParam,PayNotifyRecordDto param){
        Page<PayNotifyRecord> page = payNotifyRecordManager.page(pageParam,param);
        return MpUtil.convert2DtoPageResult(page);
    }

    /**
     * 根据id查询
     */
    public PayNotifyRecordDto findById(Long id){
        return payNotifyRecordManager.findById(id)
                .map(PayNotifyRecord::toDto)
                .orElseThrow(DataNotExistException::new);
    }
}
