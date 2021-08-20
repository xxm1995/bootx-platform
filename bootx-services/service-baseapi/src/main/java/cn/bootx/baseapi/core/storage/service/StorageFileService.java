package cn.bootx.baseapi.core.storage.service;

import cn.bootx.baseapi.core.storage.dao.StorageFileManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
* 文件存储
* @author xxm
* @date 2021/8/6
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class StorageFileService {
    private final StorageFileManager storageFileManager;

}
