package cn.bootx.platform.starter.quartz.core.entity;

import cn.bootx.platform.starter.quartz.core.convert.QuartzJobConvert;
import cn.bootx.platform.starter.quartz.param.QuartzJobParam;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.starter.quartz.code.QuartzJobCode;
import cn.bootx.platform.starter.quartz.dto.QuartzJobDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 定时任务
 *
 * @author xxm
 * @date 2021/11/2
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("starter_quartz_job")
public class QuartzJob extends MpBaseEntity implements EntityBaseFunction<QuartzJobDto> {

    /** 任务名称 */
    private String name;

    /** 任务类名 */
    private String jobClassName;

    /** cron表达式 */
    private String cron;

    /** 参数 */
    private String parameter;

    /**
     * 状态
     * @see QuartzJobCode
     */
    private Integer state;

    /** 备注 */
    private String remark;

    @Override
    public QuartzJobDto toDto() {
        return QuartzJobConvert.CONVERT.convert(this);
    }

    public static QuartzJob init(QuartzJobParam in) {
        return QuartzJobConvert.CONVERT.convert(in);
    }

}
