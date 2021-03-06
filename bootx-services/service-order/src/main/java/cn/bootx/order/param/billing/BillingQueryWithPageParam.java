package cn.bootx.order.param.billing;

import cn.bootx.common.core.rest.param.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "")
public class BillingQueryWithPageParam extends PageParam implements Serializable {

    private static final long serialVersionUID = -1135003203694525261L;
    private Long userId;

}
