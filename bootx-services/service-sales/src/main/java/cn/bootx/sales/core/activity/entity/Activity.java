package cn.bootx.sales.core.activity.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.core.activity.convert.ActivityConvert;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.dto.activity.ActivityDto;
import cn.bootx.sales.dto.activity.SimpleActivity;
import cn.bootx.sales.param.activity.ActivityParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.List;

/**   
* 策略注册
* @author xxm  
* @date 2020/10/11 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_activity")
public class Activity extends MpBaseEntity implements EntityBaseFunction<ActivityDto> {

    /** 名称 */
    private String name;

    /** 描述 */
    private String description;

    /** 策略注册id */
    private Long strategyRegisterId;

    /** 策略注册id */
    private String strategyId;

    /** 匹配内容规则*/
    @TableField(exist = false)
    private List<MatchRuleConfig> matchRules;

    /** 检测规则 */
    @TableField(exist = false)
    private List<CheckRuleConfig> checkRules;

    /** 活动互斥 */
    private String activityMutual;

    /** 有效开始时间 */
    private LocalDateTime startTime;

    /** 有效结束时间 */
    private LocalDateTime endTime;

    public static Activity init(ActivityDto dto) {
        return ActivityConvert.CONVERT.convert(dto);
    }

    public static Activity init(ActivityParam param) {
        return ActivityConvert.CONVERT.convert(param);
    }

    public SimpleActivity simple(){
        return ActivityConvert.CONVERT.simple(this);
    }

    @Override
    public ActivityDto toDto() {
        return ActivityConvert.CONVERT.convert(this);
    }
}
