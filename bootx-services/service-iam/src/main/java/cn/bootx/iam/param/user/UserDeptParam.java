package cn.bootx.iam.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
* @author xxm
* @date 2021/9/29
*/
@Data
@Accessors(chain = true)
@Schema(title = "用户")
public class UserDeptParam {
    @Schema(description= "用户id")
    private Long userId;

    @Schema(description= "部门ids")
    private List<Long> deptIds;
}
