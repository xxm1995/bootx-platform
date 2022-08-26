package cn.bootx.office.param.instance;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Map;

/**   
 * 流程任务审批参数
 * @author xxm  
 * @date 2022/8/26 
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程任务审批参数")
public class BpmTaskApproveParam {

    @Schema(description = "任务id")
    private String taskId;

    @Schema(description = "表单数据")
    private Map<String,Object> formVariables;

    @Schema(description = "审批意见")
    private String reason;

}
