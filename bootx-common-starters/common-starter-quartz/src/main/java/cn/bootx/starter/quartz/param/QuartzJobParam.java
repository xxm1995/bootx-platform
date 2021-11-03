package cn.bootx.starter.quartz.param;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 定时任务
* @author xxm
* @date 2021/11/2
*/
@Data
@Accessors(chain = true)
@ApiModel("定时任务")
public class QuartzJobParam {

    /** 主键 */
    private Long id;

    /** 任务名称 */
    private String name;

    /** 任务类名 */
    private String jobClassName;

    /** cron表达式 */
    private String cron;

    /** 参数 */
    private String parameter;

    /** 状态 */
    private Integer state;

    /** 备注 */
    private String remark;
}
