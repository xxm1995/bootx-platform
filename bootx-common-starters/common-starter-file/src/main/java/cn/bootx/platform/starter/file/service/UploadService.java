package cn.bootx.platform.starter.file.service;

import cn.bootx.platform.starter.file.code.FileUploadTypeEnum;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.starter.file.entity.UploadFileContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
 * 文件上传接口
 *
 * @author xxm
 * @date 2022/1/14
 */
public interface UploadService {

    /**
     * 判断启用
     */
    boolean enable(FileUploadTypeEnum type);

    /**
     * 上传文件
     */
    UpdateFileInfo upload(MultipartFile file, UploadFileContext context);

    /**
     * 预览文件
     */
    void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response);

    /**
     * 下载文件
     */
    InputStream download(UpdateFileInfo updateFileInfo);

    /**
     * 删除文件
     */
    void delete(UpdateFileInfo updateFileInfo);

}
