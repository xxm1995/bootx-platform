package cn.bootx.platform.starter.file.service;

import cn.bootx.platform.starter.file.code.FileUploadTypeEnum;
import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.starter.file.convert.FileConvert;
import cn.bootx.platform.starter.file.dao.UpdateFileManager;
import cn.bootx.platform.starter.file.dto.UpLoadOptions;
import cn.bootx.platform.starter.file.dto.UpdateFileDto;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/**
 * 文件上传管理类
 *
 * @author xxm
 * @since 2022/1/14
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FileUploadService {

    private final UpdateFileManager updateFileManager;
    private final FileStorageService fileStorageService;

    /**
     * 文件上传
     * @param file 文件
     * @param fileName 文件名称
     */
    @Transactional(rollbackFor = Exception.class)
    public UpdateFileDto upload(MultipartFile file, String fileName) {
        FileInfo upload = fileStorageService.of(file)
                .setName(fileName)
                .upload();
        return FileConvert.CONVERT.toDto(upload);
    }

    /**
     * 文件删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        updateFileManager.findById(id);
    }

    /**
     * 浏览
     */
    public void preview(Long id, HttpServletResponse response) {
    }

    /**
     * 文件下载
     */
    public ResponseEntity<byte[]> download(Long id) {
        return null;
    }


    /**
     * 分页
     */
    public PageResult<UpdateFileDto> page(PageParam pageParam) {
        return MpUtil.convert2DtoPageResult(updateFileManager.page(pageParam));
    }

    /**
     * 获取文件预览地址
     */
    public String getFilePreviewUrl(Long id) {
        return this.getServerUrl() + "/file/preview/" + id;
    }

    /**
     * 获取文件预览地址前缀
     */
    public String getFilePreviewUrlPrefix() {
        return this.getServerUrl() + "/file/preview/";
    }

    /**
     * 获取文件地址
     */
    public String getFileDownloadUrl(Long id) {
        return this.getServerUrl() + "/file/download/" + id;
    }

    /**
     * 服务地址
     */
    private String getServerUrl() {
        fileStorageService.get
        String serverUrl = paramService.getValue("FileServerUrl");
        return serverUrl;
    }

    public UpLoadOptions getTempCredentials() {

        TencentOssUploadService ossUploadService=(TencentOssUploadService)uploadServices.stream().filter(s -> s.enable(FileUploadTypeEnum.TENCENT_OSS))
                .findFirst().orElseThrow(() -> new BizException("未找到该类文件的处理器"));

        return ossUploadService.getTemplateCredential();

    }

    public UpdateFileDto saveUploadResult(UpdateFileInfo uploadInfo) {

        uploadInfo.setId(IdUtil.getSnowflakeNextId());
        updateFileManager.save(uploadInfo);
        return uploadInfo.toDto();
    }
}
