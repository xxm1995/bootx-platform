package cn.bootx.office.core.instance.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 任务扩展存储
 * @author xxm
 * @date 2022/8/23
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName(value = "bpm_task",autoResultMap = true)
public class BpmTask extends MpBaseEntity {

    /** 下一步处理人类别 */
    private String assignType;

    /** 下一步处理人 */
    private Long userId;

    /** 下一步处理人 */
    private String userName;
}
