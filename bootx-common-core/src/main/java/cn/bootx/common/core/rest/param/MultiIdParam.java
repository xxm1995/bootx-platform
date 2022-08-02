package cn.bootx.common.core.rest.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
* 多 id 参数
* @author xxm
* @date 2022/4/26
*/
@Getter
@Setter
@Schema(title = "多 id 参数")
public class MultiIdParam implements Serializable {
    private static final long serialVersionUID = 9120933221367165156L;

    @Schema(description = "id集合")
    private List<Long> ids;
}
