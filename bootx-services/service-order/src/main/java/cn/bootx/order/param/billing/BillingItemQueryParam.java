package cn.bootx.order.param.billing;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Accessors(chain = true)
@ApiModel("")
public class BillingItemQueryParam implements Serializable {

    private static final long serialVersionUID = -1207002879020383711L;
    private LocalDateTime startDate;

    private LocalDateTime endDate;

    private LocalDateTime startBookingKeepingDate;

    private LocalDateTime endBookingKeepingDate;

    private List<Long> shiftIds;

}
