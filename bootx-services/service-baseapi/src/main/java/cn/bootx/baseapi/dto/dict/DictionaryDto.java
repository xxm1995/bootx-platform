package cn.bootx.baseapi.dto.dict;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/4/10 14:46
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("数据字典目录")
public class DictionaryDto extends BaseDto implements Serializable {

	private static final long serialVersionUID = 8185789462442511856L;

	@ApiModelProperty("编码")
	private String code;

	@ApiModelProperty("名称")
	private String name;

	@ApiModelProperty("描述")
	private String remark;
}
