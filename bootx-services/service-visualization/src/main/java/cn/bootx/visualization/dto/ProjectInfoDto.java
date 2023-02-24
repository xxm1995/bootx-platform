package cn.bootx.visualization.dto;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 项目大屏信息
 * @author xxm
 * @date 2023/2/24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(description = "项目大屏信息")
public class ProjectInfoDto extends BaseDto {

    /** 项目名称 */
    private String name;

    /**
     * 发布状态
     * @see cn.bootx.visualization.code.GoVIewCode
     */
    private Integer state;

    /** 是否在编辑中 */
    private Boolean edit;

    /** 预览图片id */
    private Long indexImage;

    /** 备注 */
    private String remark;
}
