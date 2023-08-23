package cn.bootx.platform.miniapp.core.feedback.convert;

import cn.bootx.platform.miniapp.core.feedback.entity.FeedbackInfo;
import cn.bootx.platform.miniapp.dto.feedback.FeedbackInfoDto;
import cn.bootx.platform.miniapp.param.feedback.FeedbackInfoParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@Mapper
public interface FeedbackInfoConvert {
    FeedbackInfoConvert CONVERT = Mappers.getMapper(FeedbackInfoConvert.class);

    FeedbackInfo convert(FeedbackInfoParam in);

    FeedbackInfoDto convert(FeedbackInfo in);

}
