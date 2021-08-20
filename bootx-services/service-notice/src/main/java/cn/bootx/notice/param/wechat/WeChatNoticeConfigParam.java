package cn.bootx.notice.param.wechat;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* 微信通知配置
* @author xxm
* @date 2021/8/10
*/
@Data
@Accessors(chain = true)
@ApiModel("微信通知配置")
public class WeChatNoticeConfigParam implements Serializable {
    private static final long serialVersionUID = -8060241311764523678L;

    @ApiModelProperty("主键")
    private Long id;
}
