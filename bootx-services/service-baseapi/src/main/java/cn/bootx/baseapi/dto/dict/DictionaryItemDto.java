package cn.bootx.baseapi.dto.dict;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* 数据字典项
* @author xxm
* @date 2020/4/15 17:55
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "数据字典项Dto")
public class DictionaryItemDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 7403674221398097611L;

    /** 字典ID */
    private Long dictId;

    /** 字典编码 */
    private String dictCode;

    /** 字典项编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 字典项排序 */
    private Double sortNo;

    /** 备注 */
    private String remark;

}
