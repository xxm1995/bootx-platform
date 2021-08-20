package cn.bootx.notice.core.mail.dao;


import cn.bootx.notice.core.mail.entity.MailConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 邮件[配置
* @author xxm
* @date 2020/4/8 13:22
*/
@Mapper
public interface MailConfigMapper extends BaseMapper<MailConfig> {
}
