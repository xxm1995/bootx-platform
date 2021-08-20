package cn.bootx.baseapi.core.storage.dao;

import cn.bootx.baseapi.core.storage.entity.StorageFile;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
* 文件存储
* @author xxm
* @date 2021/8/6
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class StorageFileManager extends BaseManager<StorageFileMapper, StorageFile> {
}
