package cn.bootx.baseapi.param.dict;

import cn.bootx.common.core.validation.ValidationGroup.add;
import cn.bootx.common.core.validation.ValidationGroup.edit;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;

/**   
* 字典项参数
* @author xxm  
* @date 2021/8/4 
*/
@Data
@Accessors(chain = true)
@Schema(title = "字典项参数")
public class DictionaryItemParam implements Serializable {
    private static final long serialVersionUID = -6847496213782805488L;

    @Null(groups = add.class)
    @NotNull(groups = edit.class)
    @Schema(description= "主键")
    private Long id;

    @NotNull
    @Schema(description= "字典ID")
    private Long dictId;

    @NotEmpty
    @Schema(description= "字典编码")
    private String dictCode;

    @NotEmpty
    @Schema(description= "字典项编码")
    private String code;

    @NotEmpty
    @Schema(description= "名称")
    private String name;

    @Schema(description= "字典项排序")
    private Double sortNo;

    @Schema(description= "备注")
    private String remark;
}
