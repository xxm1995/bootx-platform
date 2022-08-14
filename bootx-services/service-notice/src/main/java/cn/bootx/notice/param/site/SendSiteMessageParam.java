package cn.bootx.notice.param.site;

import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "站内信发送参数")
public class SendSiteMessageParam {

    /**消息标题*/
    private String title;

    /**消息内容*/
    private String content;

    /** 接收者类型 */
    private String receiveType;

    /**接收者id*/
    private List<Long> receiveIds;

    /** 用户处理方式 跳转路由/跳转链接/打开组件*/
    private String handleType;

    @Data
    @Accessors(chain = true)
    @Schema(title = "接收用户信息")
    public static class User{
        /**接收者id*/
        private Long receiveId;

        /**接收者姓名*/
        private String receiveName;
    }
}
