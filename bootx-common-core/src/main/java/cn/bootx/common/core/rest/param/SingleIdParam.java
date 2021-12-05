package cn.bootx.common.core.rest.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 单 id 参数
 * @author xxm
 */
@Getter
@Setter
@Schema(title = "单 id 参数")
public class SingleIdParam implements Serializable {

    private static final long serialVersionUID = -9014016316890783082L;

    @Schema(description= "id", required = true)
    @NotNull(message = "id 不能为空")
    private Long id;
}
