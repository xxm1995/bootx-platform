package cn.bootx.baseapi.core.dict.entity;

import cn.bootx.baseapi.core.dict.convert.DictionaryConvert;
import cn.bootx.baseapi.dto.dict.DictionaryDto;
import cn.bootx.baseapi.param.dict.DictionaryParam;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**   
* 字典
* @author xxm  
* @date 2020/11/13 
*/
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("base_dict")
public class Dictionary extends MpBaseEntity implements EntityBaseFunction<DictionaryDto> {

	/** 名称 */
	private String name;

    /** 分类标签 */
    private String groupTag;

	/** 编码 */
	private String code;

	/** 备注 */
	private String remark;

	public static Dictionary init(DictionaryParam in){
		return DictionaryConvert.CONVERT.convert(in);
	}

	@Override
	public DictionaryDto toDto(){
        return DictionaryConvert.CONVERT.convert(this);
    }
}
