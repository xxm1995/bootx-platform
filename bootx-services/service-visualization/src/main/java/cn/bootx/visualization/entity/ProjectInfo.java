package cn.bootx.visualization.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 项目大屏信息
 * @author xxm
 * @date 2023/2/21
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(description = "项目大屏信息")
public class ProjectInfo extends MpBaseEntity {

    /** 项目名称 */
    private String name;

    /** 发布状态 */
    private Integer status;

    /** 报表内容 */
    private String content;

    /** 预览图片 URL */
    private String picUrl;

    /** 项目备注 */
    private String remark;

}
