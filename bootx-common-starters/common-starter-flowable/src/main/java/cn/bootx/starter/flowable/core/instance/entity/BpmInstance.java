package cn.bootx.starter.flowable.core.instance.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.starter.flowable.core.instance.convert.BpmInstanceConvert;
import cn.bootx.starter.flowable.dto.instance.BpmInstanceDto;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * 流程实例扩展
 *
 * @author xxm
 * @date 2022-08-23
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName(value = "bpm_instance", autoResultMap = true)
public class BpmInstance extends MpBaseEntity implements EntityBaseFunction<BpmInstanceDto> {

    /** 流程实例的id */
    private String instanceId;

    /** 流程实例名称 */
    private String instanceName;

    /** 模型id */
    private Long modelId;

    /** 流程定义ID */
    private String defId;

    /** 流程定义名称 */
    private String defName;

    /** 发起人 */
    private Long startUserId;

    /** 发起人名称 */
    private String startUserName;

    /** 流程实例的状态 */
    private String state;

    /** 开始时间 */
    private LocalDateTime startTime;

    /** 结束时间 */
    private LocalDateTime endTime;

    /** 提交的表单值 */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> formVariables;

    /** 转换成dto */
    @Override
    public BpmInstanceDto toDto() {
        return BpmInstanceConvert.CONVERT.convert(this);
    }

}
