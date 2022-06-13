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

;

/**
* @author xxm
* @date 2020/4/10 14:46
*/
@Data
@Accessors(chain = true)
@Schema(title = "数据字典目录")
public class DictionaryParam implements Serializable {

	private static final long serialVersionUID = 8185789462442511856L;

    @Null(message = "Id需要为空",groups = add.class)
    @NotNull(message = "Id不可为空",groups = edit.class)
    @Schema(description= "主键")
    private Long id;

    @NotEmpty(message = "编码不可以为空",groups = add.class)
    @Schema(description= "编码")
	private String code;

    @NotEmpty(message = "编码不可以为空",groups = add.class)
    @Schema(description= "名称")
	private String name;

    @Schema(description= "分类标签")
    private String groupTag;

	@Schema(description= "描述")
	private String remark;
}
