package cn.bootx.platform.starter.file.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.recorder.FileRecorder;
import org.springframework.stereotype.Service;

/**
 * x.file.storage 文件上传信息储存
 * @author xxm
 * @since 2023/11/13
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FileDetailRecordHandler implements FileRecorder {
    /**
     * 保存文件记录
     */
    @Override
    public boolean save(FileInfo fileInfo) {
        return true;
    }

    /**
     * 根据 url 获取文件记录
     */
    @Override
    public FileInfo getByUrl(String url) {
        return null;
    }

    /**
     * 根据 url 删除文件记录
     */
    @Override
    public boolean delete(String url) {
        return false;
    }
}
