package cn.bootx.baseapi.core.storage.dao;

import cn.bootx.baseapi.core.storage.entity.StorageFile;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* 文件存储
* @author xxm
* @date 2021/8/6
*/
@Mapper
public interface StorageFileMapper extends BaseMapper<StorageFile> {
}
