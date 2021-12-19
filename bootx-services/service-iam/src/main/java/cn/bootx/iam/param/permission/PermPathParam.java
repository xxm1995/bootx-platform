package cn.bootx.iam.param.permission;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/6/16
*/
@Data
@Accessors(chain = true)
@Schema(title = "权限信息参数")
public class PermPathParam implements Serializable {
    private static final long serialVersionUID = 7617748080025164673L;

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "权限标识")
    private String code;

    @Schema(description = "权限名称")
    private String name;

    @Schema(description = "请求类型")
    private String requestType;

    @Schema(description = "请求路径")
    private String path;

    @Schema(description = "启用")
    private boolean enable;

    @Schema(description = "描述")
    private String remark;

    @Schema(description = "请求方法名")
    private String methodName;

    @Schema(description = "请求方法描述")
    private String methodRemark;

    @Schema(description = "请求类名")
    private String className;

    @Schema(description = "请求类描述")
    private String classRemark;

}
