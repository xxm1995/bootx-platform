package cn.bootx.platform.baseapi.param.dict;

import cn.bootx.platform.common.core.validation.ValidationGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;

/**
 * 字典项参数
 *
 * @author xxm
 * @since 2021/8/4
 */
@Data
@Accessors(chain = true)
@Schema(title = "字典项参数")
public class DictionaryItemParam implements Serializable {

    private static final long serialVersionUID = -6847496213782805488L;

    @Null(message = "Id需要为空", groups = ValidationGroup.add.class)
    @NotNull(message = "Id不可为空", groups = ValidationGroup.edit.class)
    @Schema(description = "主键")
    private Long id;

    @NotNull(message = "字典ID不可为空")
    @Schema(description = "字典ID")
    private Long dictId;

    @Schema(description = "字典编码")
    private String dictCode;

    @NotEmpty(message = "字典项编码不可为空", groups = ValidationGroup.add.class)
    @Schema(description = "字典项编码")
    private String code;

    @NotEmpty(message = "字典项编码不可为空", groups = ValidationGroup.add.class)
    @Schema(description = "名称")
    private String name;

    @NotNull(message = "启用状态不可为空", groups = ValidationGroup.add.class)
    @Schema(description = "启用状态")
    private Boolean enable;

    @Schema(description = "字典项排序")
    private Double sortNo;

    @Schema(description = "备注")
    private String remark;

}
