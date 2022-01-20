package cn.bootx.starter.file.service.impl;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.starter.file.code.FileUploadTypeCode;
import cn.bootx.starter.file.entity.UpdateFileInfo;
import cn.bootx.starter.file.entity.mongo.MongoUploadFile;
import cn.bootx.starter.file.service.UploadService;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.bson.types.Binary;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Optional;

/**
* mongo方式存储文件
* @author xxm
* @date 2022/1/12
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class MongoUploadService implements UploadService {
    private final GridFsTemplate gridFsTemplate;
    private final MongoTemplate mongoTemplate;
    @Override
    public boolean enable(int type) {
        return type == FileUploadTypeCode.MONGO;
    }

    /**
     * 上传
     * @return
     */
    @SneakyThrows
    @Override
    public UpdateFileInfo upload(MultipartFile file, String fileSuffix) {
        byte[] bytes = file.getBytes();
        MongoUploadFile mongoUploadFile = new MongoUploadFile().setId(IdUtil.getSnowflake().nextId())
                .setContent(new Binary(bytes));

        mongoTemplate.save(mongoUploadFile);
        UpdateFileInfo updateFileInfo = new UpdateFileInfo()
                .setFileSize(file.getSize() / 1024.0);
        updateFileInfo.setId(mongoUploadFile.getId());
        return updateFileInfo;
    }

    @SneakyThrows
    @Override
    public void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response) {
        MongoUploadFile mongoUploadFile = Optional.ofNullable(mongoTemplate.findById(updateFileInfo.getId(), MongoUploadFile.class))
                .orElseThrow(DataNotExistException::new);
        Binary content = mongoUploadFile.getContent();
        byte[] bytes = content.getData();
        InputStream is = new ByteArrayInputStream(bytes);
        //获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        IoUtil.copy(is, os);
        response.addHeader(HttpHeaders.CONTENT_DISPOSITION, updateFileInfo.getFileType());
        IoUtil.close(is);
        IoUtil.close(os);
    }

    @SneakyThrows
    @Override
    public InputStream download(UpdateFileInfo updateFileInfo, HttpServletResponse response) {
        MongoUploadFile mongoUploadFile = Optional.ofNullable(mongoTemplate.findById(updateFileInfo.getId(), MongoUploadFile.class))
                .orElseThrow(DataNotExistException::new);
        Binary content = mongoUploadFile.getContent();
        byte[] bytes = content.getData();
        return new ByteArrayInputStream(bytes);
    }
}
