package cn.bootx.starter.file.service;

import cn.bootx.starter.file.entity.UpdateFileInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
* 文件上传接口
* @author xxm
* @date 2022/1/14
*/
public interface UploadService {
    /**
     * 判断启用
     */
    boolean enable(int type);
    /**
     * 上传文件
     */
    UpdateFileInfo upload(MultipartFile file, String fileSuffix);
    /**
     * 预览文件
     */
    void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response);

    /**
     * 下载文件
     */
    InputStream download(UpdateFileInfo updateFileInfo, HttpServletResponse response);
}
