package cn.bootx.starter.quartz.core.entity;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**   
* 任务执行日志
* @author xxm  
* @date 2021/8/20 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("starter_quartz_job_log")
public class QuartzJobLog extends MpIdEntity {

    /** 处理器的名字 */
    private String handlerName;

    /** 是否执行成功 */
    private Boolean success;

    /** 执行时长 */
    private Long duration;

    /** 错误信息 */
    private String errorMessage;

    /** 开始时间 */
    private LocalDateTime startTime;

    /** 结束时间 */
    private LocalDateTime endTime;

}
