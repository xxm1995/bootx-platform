package cn.bootx.payment.core.refund.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 退款记录
* @author xxm  
* @date 2022/3/2 
*/
@Data
@Accessors(chain = true)
@TableName("pc_refund_record")
public class RefundRecord {
}
