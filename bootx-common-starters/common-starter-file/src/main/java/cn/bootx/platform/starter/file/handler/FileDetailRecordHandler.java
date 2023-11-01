package cn.bootx.platform.starter.file.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.recorder.FileRecorder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileDetailRecordHandler implements FileRecorder {
    /**
     * @param fileInfo
     * @return
     */
    @Override
    public boolean save(FileInfo fileInfo) {
        return false;
    }

    /**
     * @param url
     * @return
     */
    @Override
    public FileInfo getByUrl(String url) {
        return null;
    }

    /**
     * @param url
     * @return
     */
    @Override
    public boolean delete(String url) {
        return false;
    }
}
