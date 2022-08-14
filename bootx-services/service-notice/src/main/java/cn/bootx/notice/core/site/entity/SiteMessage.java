package cn.bootx.notice.core.site.entity;

import cn.bootx.common.core.annotation.BigField;
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
@TableName("notice_site_message")
public class SiteMessage extends MpBaseEntity implements EntityBaseFunction<SiteMessageDto> {

    /**消息标题*/
    private String title;

    /**消息内容*/
    @BigField
    private String content;

    /** 接收对象类型 全体/指定用户 */
    private String receiveType;

    /** 发布状态 */
    private String sendState;

    /**发送者id*/
    private Long senderId;

    /**发送者姓名*/
    private String senderName;

    /**发送时间*/
    private LocalDateTime senderTime;

    /** 撤销时间 */
    private LocalDateTime cancelTime;

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
