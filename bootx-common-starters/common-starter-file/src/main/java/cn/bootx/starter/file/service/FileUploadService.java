package cn.bootx.starter.file.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.function.ParamService;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.file.configuration.FileUploadProperties;
import cn.bootx.starter.file.dao.UpdateFileManager;
import cn.bootx.starter.file.dto.UpdateFileDto;
import cn.bootx.starter.file.entity.UpdateFileInfo;
import cn.bootx.starter.file.entity.UploadFileContext;
import cn.hutool.core.io.FileTypeUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
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
import java.util.List;

/**
 * 文件上传管理类
 *
 * @author xxm
 * @date 2022/1/14
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FileUploadService {

    private final List<UploadService> uploadServices;

    private final UpdateFileManager updateFileManager;

    private final FileUploadProperties fileUploadProperties;

    private final ParamService paramService;

    /**
     * 文件上传
     * @param file 文件
     * @param fileName 文件名称
     */
    @Transactional(rollbackFor = Exception.class)
    public UpdateFileDto upload(MultipartFile file, String fileName) throws IOException {
        val uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
            .filter(s -> s.enable(uploadType))
            .findFirst()
            .orElseThrow(() -> new BizException("未找到该类的上传处理器"));
        if (file.isEmpty()) {
            throw new BizException("文件不可为空");
        }
        // 上传文件信息
        if (StrUtil.isBlank(fileName)) {
            fileName = file.getOriginalFilename();
        }
        String fileType = FileTypeUtil.getType(file.getInputStream(), fileName);
        String fileSuffix = fileType;

        // 获取不到类型名,后缀名使用上传文件名称的后缀
        if (StrUtil.isBlank(fileSuffix)) {
            fileSuffix = StrUtil.subAfter(fileName, ".", true);
        }
        UploadFileContext context = new UploadFileContext().setFileId(IdUtil.getSnowflakeNextId())
            .setFileName(fileName)
            .setFileSuffix(fileSuffix);

        UpdateFileInfo uploadInfo = uploadService.upload(file, context);
        uploadInfo.setFileSuffix(fileSuffix).setFileType(fileType).setFileName(fileName);
        uploadInfo.setId(context.getFileId());
        updateFileManager.save(uploadInfo);
        return uploadInfo.toDto();
    }

    /**
     * 浏览
     */
    public void preview(Long id, HttpServletResponse response) {
        val uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
            .filter(s -> s.enable(uploadType))
            .findFirst()
            .orElseThrow(() -> new BizException("未找到该类的上传处理器"));
        UpdateFileInfo updateFileInfo = updateFileManager.findById(id).orElseThrow(() -> new BizException("文件不存在"));
        uploadService.preview(updateFileInfo, response);
    }

    /**
     * 文件下载
     */
    public ResponseEntity<byte[]> download(Long id) {
        val uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
            .filter(s -> s.enable(uploadType))
            .findFirst()
            .orElseThrow(() -> new BizException("未找到该类文件的处理器"));
        UpdateFileInfo updateFileInfo = updateFileManager.findById(id).orElseThrow(() -> new BizException("文件不存在"));
        InputStream inputStream = uploadService.download(updateFileInfo);
        // 设置header信息
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment",
                new String(updateFileInfo.getFileName().getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1));
        return new ResponseEntity<>(IoUtil.readBytes(inputStream), headers, HttpStatus.OK);
    }

    /**
     * 获取文件字节数组
     */
    public byte[] getFileBytes(Long id) {
        val uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
            .filter(s -> s.enable(uploadType))
            .findFirst()
            .orElseThrow(() -> new BizException("未找到该类文件的处理器"));
        UpdateFileInfo updateFileInfo = updateFileManager.findById(id).orElseThrow(() -> new BizException("文件不存在"));
        InputStream inputStream = uploadService.download(updateFileInfo);
        return IoUtil.readBytes(inputStream);
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
        String serverUrl = paramService.getValue("FileServerUrl");
        if (StrUtil.isBlank(serverUrl)) {
            serverUrl = fileUploadProperties.getServerUrl();
        }
        return serverUrl;
    }

}
