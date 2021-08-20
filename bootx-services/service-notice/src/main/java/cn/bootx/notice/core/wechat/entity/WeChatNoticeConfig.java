package cn.bootx.notice.core.wechat.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 微信消息配置
* @author xxm  
* @date 2021/8/10 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("nc_wechat_config")
public class WeChatNoticeConfig extends MpBaseEntity {
}
