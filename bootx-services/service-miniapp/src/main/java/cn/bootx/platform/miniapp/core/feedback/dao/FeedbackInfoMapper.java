package cn.bootx.platform.miniapp.core.feedback.dao;

import cn.bootx.platform.miniapp.core.feedback.entity.FeedbackInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@Mapper
public interface FeedbackInfoMapper extends BaseMapper<FeedbackInfo> {
}
