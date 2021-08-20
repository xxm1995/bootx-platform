package cn.bootx.baseapi.core.dict.entity;

import cn.bootx.baseapi.core.dict.convert.DictionaryConvert;
import cn.bootx.baseapi.dto.dict.DictionaryItemDto;
import cn.bootx.baseapi.param.dict.DictionaryItemParam;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 字典项
 * @author xxm
 * @date 2020/4/15 17:45
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sys_dict_item")
public class DictionaryItem extends MpBaseEntity implements EntityBaseFunction<DictionaryItemDto> {

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

    public static DictionaryItem init(DictionaryItemDto in) {
        return DictionaryConvert.CONVERT.convert(in);
    }
    public static DictionaryItem init(DictionaryItemParam in) {
        return DictionaryConvert.CONVERT.convert(in);
    }

    @Override
    public DictionaryItemDto toDto() {
        return DictionaryConvert.CONVERT.convert(this);
    }

}

