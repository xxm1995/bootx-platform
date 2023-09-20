package cn.bootx.platform.miniapp.core.feedback.entity;

import cn.bootx.table.modify.annotation.DbComment;
import cn.bootx.table.modify.annotation.DbTable;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.miniapp.core.feedback.convert.FeedbackInfoConvert;
import cn.bootx.platform.miniapp.dto.feedback.FeedbackInfoDto;
import cn.bootx.platform.miniapp.param.feedback.FeedbackInfoParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023/8/15
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("miniapp_feedback_info")
public class FeedbackInfo extends MpBaseEntity implements EntityBaseFunction<FeedbackInfoDto> {

    /** 问题分类 */
    @DbComment("问题分类")
    private String classify;

    /** 时间 */
    @DbComment("时间")
    private LocalDateTime time;

    /** 联系方式 */
    @DbComment("联系方式")
    private String contact;

    /** 姓名 */
    @DbComment("姓名")
    private String name;

    /** 反馈用户ID */
    @DbComment("反馈用户ID")
    private Long userId;

    /** 内容 */
    @DbComment("内容")
    private String content;

    /** 创建对象 */
    public static FeedbackInfo init(FeedbackInfoParam in) {
        return FeedbackInfoConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public FeedbackInfoDto toDto() {
        return FeedbackInfoConvert.CONVERT.convert(this);
    }
}
