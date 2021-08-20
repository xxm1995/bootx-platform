package cn.bootx.baseapi.param.dict;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* 字典项参数
* @author xxm  
* @date 2021/8/4 
*/
@Data
@Accessors(chain = true)
@ApiModel("字典项参数")
public class DictionaryItemParam implements Serializable {
    private static final long serialVersionUID = -6847496213782805488L;

    @ApiModelProperty("主键")
    private Long id;

    /** 字典ID */
    private Long dictId;

    /** 字典编码 */
    private String dictCode;

    /** 字典项编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 内容 */
    private String value;

    /** 备注 */
    private String remark;
}
