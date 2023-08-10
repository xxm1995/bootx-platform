package cn.bootx.platform.baseapi.dto.chinaword;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 敏感词验证结果
 * @author xxm
 * @since 2023/8/9
 */
@Data
@Accessors(chain = true)
@Schema(title = "敏感词验证结果")
public class ChinaWordVerifyResult {

    @Schema(description = "是否敏感")
    private boolean sensitive;
    @Schema(description = "敏感词数量")
    private int count;
    @Schema(description = "脱敏后的文本")
    private String text;
}
