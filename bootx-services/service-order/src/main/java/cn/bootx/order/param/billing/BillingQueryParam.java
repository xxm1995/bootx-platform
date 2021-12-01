package cn.bootx.order.param.billing;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Accessors(chain = true)
@Schema(title = "")
public class BillingQueryParam implements Serializable {

    private static final long serialVersionUID = 8185462187197241155L;
    private LocalDateTime startDate;

    private LocalDateTime endDate;

    private Long userId;

}
