package cn.bootx.office.param.instance;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Map;

/**
* @author xxm
* @date 2020/3/1 13:47
*/
@Data
@Accessors(chain = true)
@Schema(title = "流程启动参数")
public class FlowInstanceParam {
    @Schema(description = "流程实例id")
    private Long modelId;
    @Schema(description = "实例名称")
    private String name;
    @Schema(description = "外部key")
    private String businessKey;
    @Schema(description = "表单信息")
    private Map<String,Object> formVariables;

}
