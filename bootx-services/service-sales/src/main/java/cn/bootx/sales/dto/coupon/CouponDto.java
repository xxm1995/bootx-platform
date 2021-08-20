package cn.bootx.sales.dto.coupon;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2020/11/2
*/
@Data
@Accessors(chain = true)
@ApiModel("优惠卷")
public class CouponDto implements Serializable {
    private static final long serialVersionUID = 3307473463220855296L;

    /** 主键 */
    private Long id;

    /** 名称 */
    private String name;

    /** 模板id */
    private Long templateId;

    /** 策略注册id */
    private Long strategyRegisterId;

    /** 状态 */
    private int status;

    /** 用于的订单 */
    private Long orderId;

    /** 1可选2已选3不可选 */
    private int canUse;

    /** 描述 */
    private String description;

    /** 有效开始时间 */
    private LocalDateTime startTime;

    /** 有效结束时间 */
    private LocalDateTime endTime;

    /** 领取时间 */
    private LocalDateTime obtainTime;

    /** 使用时间 */
    private LocalDateTime usedTime;

    /** 用户id */
    private Long userId;
}
