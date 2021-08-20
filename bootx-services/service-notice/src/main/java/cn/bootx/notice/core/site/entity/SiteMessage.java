package cn.bootx.notice.core.site.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.notice.core.site.convert.SiteMessageConvert;
import cn.bootx.notice.dto.site.SiteMessageDto;
import cn.bootx.notice.param.site.SiteMessageParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
* 站内信
* @author xxm
* @date 2021/8/7
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("nc_site_message")
public class SiteMessage extends MpBaseEntity implements EntityBaseFunction<SiteMessageDto> {

    /**消息标题*/
    private String title;

    /**消息内容*/
    private String content;

    /**发送者id*/
    private Long senderId;

    /**发送者姓名*/
    private String senderName;

    /**接收者id*/
    private Long receiveId;

    /**接收者姓名*/
    private String receiveName;

    /**发送时间*/
    private LocalDateTime senderTime;

    /** 已读 */
    private Boolean haveRead;

    /** 已读时间 */
    private LocalDateTime readTime;

    public static SiteMessage init(SiteMessageDto in) {
        return SiteMessageConvert.CONVERT.convert(in);
    }

    public static SiteMessage init(SiteMessageParam in) {
        return SiteMessageConvert.CONVERT.convert(in);
    }


    @Override
    public SiteMessageDto toDto() {
        return SiteMessageConvert.CONVERT.convert(this);
    }
}
