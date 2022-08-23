package cn.bootx.office.core.instance.entity;

import java.time.LocalDateTime;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import cn.bootx.office.dto.instance.BpmInstanceDto;
import cn.bootx.office.param.instance.BpmInstanceParam;
import cn.bootx.office.core.instance.convert.BpmInstanceConvert;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 流程实例扩展
* @author xxm
* @date 2022-08-23
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("bpm_instance")
public class BpmInstance extends MpBaseEntity implements EntityBaseFunction<BpmInstanceDto>{

    /** 关联模型id */
    private Long flowModelId;
    /** 流程实例的id */
    private String instanceId;
    /** 流程定义的id */
    private String defId;
    /** 流程定义的名称 */
    private String defName;
    /** 流程分类 */
    private String modelType;
    /** 发起人 */
    private Long startUserId;
    /** 流程实例的状态 */
    private String state;
    /** 流程实例的执行结果 */
    private String result;
    /** 开始时间 */
    private LocalDateTime startTime;
    /** 结束时间 */
    private LocalDateTime endTime;
    /** 提交的表单值 */
    private String formVariables;

    /** 创建对象 */
    public static BpmInstance init(BpmInstanceParam in) {
            return BpmInstanceConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public BpmInstanceDto toDto() {
        return BpmInstanceConvert.CONVERT.convert(this);
    }
}
