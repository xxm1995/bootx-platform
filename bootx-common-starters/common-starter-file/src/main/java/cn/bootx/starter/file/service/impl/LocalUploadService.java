package cn.bootx.starter.file.service.impl;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.file.code.FileUploadTypeEnum;
import cn.bootx.starter.file.configuration.FileUploadProperties;
import cn.bootx.starter.file.entity.UpdateFileInfo;
import cn.bootx.starter.file.entity.UploadFileContext;
import cn.bootx.starter.file.service.UploadService;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Optional;

/**
 * 上传文件本地存储
 *
 * @author xxm
 * @date 2022/1/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class LocalUploadService implements UploadService {

    private final FileUploadProperties fileUploadProperties;

    @Override
    public boolean enable(FileUploadTypeEnum type) {
        return type == FileUploadTypeEnum.LOCAL;
    }

    /**
     * 文件上传
     */
    @SneakyThrows
    @Override
    public UpdateFileInfo upload(MultipartFile file, UploadFileContext context) {
        String fileSuffix = Optional.ofNullable(context.getFileSuffix()).map(s -> "." + s).orElse("");
        String filePath = DateUtil.today() + "/" + IdUtil.getSnowflakeNextIdStr() + fileSuffix;
        String storePath = fileUploadProperties.getLocal().getLocalPath() + filePath;
        FileUtil.writeFromStream(file.getInputStream(), storePath);
        return new UpdateFileInfo().setFilePath(filePath).setFileSize(file.getSize());
    }

    /**
     * 浏览
     */
    @SneakyThrows
    @Override
    public void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response) {
        String storePath = fileUploadProperties.getLocal().getLocalPath() + updateFileInfo.getFilePath();
        File file = new File(storePath);
        if (!file.exists()) {
            throw new BizException("文件不存在");
        }
        FileInputStream is = new FileInputStream(file);
        // 获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        IoUtil.copy(is, os);
        response.addHeader(HttpHeaders.CONTENT_DISPOSITION, updateFileInfo.getFileType());
        IoUtil.close(is);
        IoUtil.close(os);
    }

    /**
     * 下载
     */
    @SneakyThrows
    @Override
    public InputStream download(UpdateFileInfo updateFileInfo) {
        String storePath = fileUploadProperties.getLocal().getLocalPath() + updateFileInfo.getFilePath();
        File file = new File(storePath);
        if (!file.exists()) {
            throw new BizException("文件不存在");
        }
        return Files.newInputStream(file.toPath());
    }

    /**
     * 删除文件
     */
    @Override
    public void delete(UpdateFileInfo updateFileInfo) {
        String storePath = fileUploadProperties.getLocal().getLocalPath() + updateFileInfo.getFilePath();
        FileUtil.del(storePath);
    }

}
