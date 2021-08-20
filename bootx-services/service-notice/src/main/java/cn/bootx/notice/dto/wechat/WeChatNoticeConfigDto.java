package cn.bootx.notice.dto.wechat;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* 微信通知配置
* @author xxm
* @date 2021/8/10
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("微信通知配置")
public class WeChatNoticeConfigDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 4862614438727322307L;
}
