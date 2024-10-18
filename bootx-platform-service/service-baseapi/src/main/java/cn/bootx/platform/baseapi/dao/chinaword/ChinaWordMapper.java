package cn.bootx.platform.baseapi.dao.chinaword;

import cn.bootx.platform.baseapi.entity.chinaword.ChinaWord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 敏感词
 * @author xxm
 * @since 2023-08-09
 */
@Mapper
public interface ChinaWordMapper extends MPJBaseMapper<ChinaWord> {
}

