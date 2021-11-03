package cn.bootx.starter.quartz.dto;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 定时任务
* @author xxm  
* @date 2021/11/2 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("定时任务")
public class QuartzJobDto extends BaseDto {

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
