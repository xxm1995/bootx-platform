package cn.bootx.baseapi.core.dict.dao;

import cn.bootx.baseapi.core.dict.entity.DictionaryItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 字典项
 *
 * @author xxm
 * @date 2020/11/13
 */
@Mapper
public interface DictionaryItemMapper extends BaseMapper<DictionaryItem> {

}
