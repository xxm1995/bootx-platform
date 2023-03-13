package cn.bootx.baseapi.core.dict.dao;

import cn.bootx.baseapi.core.dict.entity.Dictionary;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 字典
 *
 * @author xxm
 * @date 2021/8/4
 */
@Mapper
public interface DictionaryMapper extends BaseMapper<Dictionary> {

}