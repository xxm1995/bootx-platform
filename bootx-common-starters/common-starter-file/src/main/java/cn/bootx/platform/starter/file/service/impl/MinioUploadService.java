package cn.bootx.platform.starter.file.service.impl;

import cn.bootx.platform.starter.file.configuration.FileUploadProperties;
import cn.bootx.platform.starter.file.code.FileUploadTypeEnum;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.starter.file.entity.UploadFileContext;
import cn.bootx.platform.starter.file.service.UploadService;
import cn.hutool.core.io.IoUtil;
import io.minio.*;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Objects;

/**
 * minio方式存储文件
 *
 * @author xxm
 * @date 2022/1/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class MinioUploadService implements UploadService {

    private final FileUploadProperties fileUploadProperties;

    private MinioClient client;

    /**
     * 判断启用
     */
    @Override
    public boolean enable(FileUploadTypeEnum type) {
        boolean b = type == FileUploadTypeEnum.MINIO;
        if (b) {
            this.doInit();
        }
        return b;
    }

    /**
     * 上传文件
     */
    @SneakyThrows
    @Override
    public UpdateFileInfo upload(MultipartFile file, UploadFileContext context) {
        FileUploadProperties.Minio minio = fileUploadProperties.getMinio();
        PutObjectArgs putObjectArgs = PutObjectArgs.builder()
            .bucket(minio.getBucket()) // bucket
                                       // 必须传递
            .contentType(file.getContentType())
            .object(context.getFileId() + "." + context.getFileSuffix())
            .stream(file.getInputStream(), file.getSize(), -1) // 文件内容
            .build();
        // 执行上传
        client.putObject(putObjectArgs);
        return new UpdateFileInfo().setExternalStorageId(putObjectArgs.object()).setFileSize(file.getSize());
    }

    /**
     * 预览文件
     */
    @SneakyThrows
    @Override
    public void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response) {
        FileUploadProperties.Minio minio = fileUploadProperties.getMinio();
        String storageId = updateFileInfo.getExternalStorageId();
        GetObjectResponse inputStream = client
            .getObject(GetObjectArgs.builder().bucket(minio.getBucket()).object(storageId).build());
        // 获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        IoUtil.copy(inputStream, os);
        response.addHeader(HttpHeaders.CONTENT_DISPOSITION, updateFileInfo.getFileType());
        IoUtil.close(inputStream);
        IoUtil.close(os);
    }

    /**
     * 下载文件
     */
    @SneakyThrows
    @Override
    public InputStream download(UpdateFileInfo updateFileInfo) {
        FileUploadProperties.Minio minio = fileUploadProperties.getMinio();
        String storageId = updateFileInfo.getExternalStorageId();
        return client.getObject(GetObjectArgs.builder()
            .bucket(minio.getBucket()) // bucket
                                       // 必须传递
            .object(storageId) // 相对路径作为 key
            .build());
    }

    /**
     * 删除文件
     */
    @SneakyThrows
    @Override
    public void delete(UpdateFileInfo updateFileInfo) {
        FileUploadProperties.Minio minio = fileUploadProperties.getMinio();
        client.removeObject(RemoveObjectArgs.builder()
            .bucket(minio.getBucket()) // bucket
                                       // 必须传递
            .object(updateFileInfo.getExternalStorageId()) // 相对路径作为 key
            .build());
    }

    /**
     * 初始化
     */
    protected void doInit() {
        if (Objects.nonNull(client)) {
            return;
        }
        FileUploadProperties.Minio minio = fileUploadProperties.getMinio();
        // 初始化客户端
        client = MinioClient.builder()
            .endpoint(minio.getEndpoint()) // Endpoint URL
            .region(minio.getRegion()) // Region
            .credentials(minio.getAccessKey(), minio.getAccessSecret()) // 认证密钥
            .build();
    }

}
