package cn.bootx.baseapi.dto.region;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 中国行政区域通用对象
 * @author xxm
 * @date 2022/12/24
 */
@Data
@Accessors(chain = true)
@Schema(title = "中国行政区域通用对象")
@RequiredArgsConstructor
@NoArgsConstructor
public class RegionDto {

    @Schema(description = "主键编码")
    @NonNull
    private Integer id;
    @Schema(description = "名称")
    @NonNull
    private String name;
    @Schema(description = "级别")
    @NonNull
    private Integer level;
    @Schema(description = "上级id")
    private Integer pid;

    @Schema(description = "下一级行政区域")
    private List<RegionDto> children;

}
