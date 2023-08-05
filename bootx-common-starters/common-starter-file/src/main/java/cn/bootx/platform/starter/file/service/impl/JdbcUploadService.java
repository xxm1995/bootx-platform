package cn.bootx.platform.starter.file.service.impl;

import cn.bootx.platform.common.core.exception.DataNotExistException;
import cn.bootx.platform.starter.file.code.FileUploadTypeEnum;
import cn.bootx.platform.starter.file.configuration.FileUploadProperties;
import cn.bootx.platform.starter.file.dao.JdbcFileDataManager;
import cn.bootx.platform.starter.file.entity.JdbcFileData;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.starter.file.entity.UploadFileContext;
import cn.bootx.platform.starter.file.service.UploadService;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.io.IoUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * 数据库存储上传文件
 * @author xxm
 * @since 2023/8/5
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class JdbcUploadService implements UploadService {
    private final JdbcFileDataManager jdbcFileDataManager;

    private final FileUploadProperties fileUploadProperties;

    /**
     * 判断启用
     */
    @Override
    public boolean enable(FileUploadTypeEnum type) {
        return type==FileUploadTypeEnum.JDBC;
    }

    /**
     * 上传文件
     *
     * @param file
     * @param context
     */
    @SneakyThrows
    @Override
    public UpdateFileInfo upload(MultipartFile file, UploadFileContext context) {
        FileUploadProperties.JDBC jdbc = fileUploadProperties.getJdbc();
        JdbcFileData jdbcFileData;
        byte[] bytes = file.getBytes();
        if (jdbc.isBase64()){
            jdbcFileData =new JdbcFileData().setBase64(Base64.encode(bytes));
        } else {
            jdbcFileData =new JdbcFileData().setData(bytes);
        }
        jdbcFileDataManager.save(jdbcFileData);
        return new UpdateFileInfo().setExternalStorageId(String.valueOf(jdbcFileData.getId())).setFileSize(file.getSize());
    }

    /**
     * 预览文件
     */
    @SneakyThrows
    @Override
    public void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response) {
        FileUploadProperties.JDBC jdbc = fileUploadProperties.getJdbc();
        Long id = Long.valueOf(updateFileInfo.getExternalStorageId());
        JdbcFileData jdbcFileData = jdbcFileDataManager.findById(id)
                .orElseThrow(DataNotExistException::new);
        InputStream inputStream;
        if (jdbc.isBase64()){
            inputStream = new ByteArrayInputStream(Base64.decode(jdbcFileData.getBase64()));
        } else {
            inputStream = new ByteArrayInputStream(jdbcFileData.getData());
        }

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
    @Override
    public InputStream download(UpdateFileInfo updateFileInfo) {
        FileUploadProperties.JDBC jdbc = fileUploadProperties.getJdbc();
        Long id = Long.valueOf(updateFileInfo.getExternalStorageId());
        JdbcFileData jdbcFileData = jdbcFileDataManager.findById(id)
                .orElseThrow(DataNotExistException::new);
        if (jdbc.isBase64()){
            return new ByteArrayInputStream(Base64.decode(jdbcFileData.getBase64()));
        } else {
            return new ByteArrayInputStream(jdbcFileData.getData());
        }
    }

    /**
     * 删除文件
     */
    @Override
    public void delete(UpdateFileInfo updateFileInfo) {
        Long id = Long.valueOf(updateFileInfo.getExternalStorageId());
        jdbcFileDataManager.deleteById(id);
    }
}
