package cn.bootx.iam.param.scope;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
* @author xxm
* @date 2021/12/24
*/
@Data
@Accessors(chain = true)
@Schema(title = "部门范围")
public class DataScopeUserParam {

    @Schema(description = "数据权限id")
    private Long dataScopeId;

    @Schema(description = "用户id")
    private List<Long> userIds;
}
