package cn.bootx.starter.flowable.param.task;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
 * 流程回退参数
 * @author xxm  
 * @date 2022/8/30 
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程回退参数")
public class TaskReturnParam {

    @Schema(description = "任务id")
    private String taskId;
    @Schema(description = "回退到的节点key")
    private String targetKey;
}
