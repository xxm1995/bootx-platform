package cn.bootx.starter.quartz.core.entity;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

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

    private String taskName;

    private String message;

    private String errorMessage;
}
