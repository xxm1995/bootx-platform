package cn.bootx.iam.param.upms;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/6/17
*/
@Data
@Accessors(chain = true)
@Schema(title = "角色")
public class RoleParam {

    @Schema(name = "角色id")
    private Long id;

    @Schema(name = "角色code")
    private String code;

    @Schema(name = "角色名称")
    private String name;

    @Schema(name = "描述")
    private String description;
}
