package cn.bootx.platform.starter.quartz.core.entity;

import cn.bootx.platform.starter.quartz.core.convert.QuartzJobConvert;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import cn.bootx.platform.starter.quartz.dto.QuartzJobLogDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 任务执行日志
 *
 * @author xxm
 * @date 2021/8/20
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("starter_quartz_job_log")
public class QuartzJobLog extends MpIdEntity implements EntityBaseFunction<QuartzJobLogDto> {

    /** 处理器的名字 */
    private String handlerName;

    /** 处理器全限定名 */
    private String className;

    /** 是否执行成功 */
    private Boolean success;

    /** 错误信息 */
    private String errorMessage;

    /** 开始时间 */
    private LocalDateTime startTime;

    /** 结束时间 */
    private LocalDateTime endTime;

    /** 执行时长 */
    private Long duration;

    /** 创建时间 */
    private LocalDateTime createTime;

    @Override
    public QuartzJobLogDto toDto() {
        return QuartzJobConvert.CONVERT.convert(this);
    }

}
