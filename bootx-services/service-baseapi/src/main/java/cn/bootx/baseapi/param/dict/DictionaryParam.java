package cn.bootx.baseapi.param.dict;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/4/10 14:46
*/
@Data
@Accessors(chain = true)
@Schema(title = "数据字典目录")
public class DictionaryParam implements Serializable {

	private static final long serialVersionUID = 8185789462442511856L;

    @Schema(name = "主键")
    private Long id;

    @Schema(name = "编码")
	private String code;

	@Schema(name = "名称")
	private String name;

	@Schema(name = "描述")
	private String remark;
}
