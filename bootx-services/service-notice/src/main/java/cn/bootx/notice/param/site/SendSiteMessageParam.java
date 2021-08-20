package cn.bootx.notice.param.site;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
* 站内信发送参数
* @author xxm  
* @date 2021/8/8 
*/
@Data
@Accessors(chain = true)
@ApiModel("站内信发送参数")
public class SendSiteMessageParam {

    /**消息标题*/
    private String title;

    /**消息内容*/
    private String content;

    /**接收者id*/
    private List<User> receiveIds;

    @Data
    @Accessors(chain = true)
    @ApiModel("接收用户信息")
    public static class User{
        /**接收者id*/
        private Long receiveId;

        /**接收者姓名*/
        private String receiveName;
    }
}
