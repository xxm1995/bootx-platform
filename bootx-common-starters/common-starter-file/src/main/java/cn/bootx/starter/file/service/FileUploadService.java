package cn.bootx.starter.file.service;

import cn.bootx.common.core.exception.BizException;
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
* 文件上传
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

    /**
     * 文件上传
     * @param file 文件
     * @param fileName 文件名称
     */
    @Transactional(rollbackFor = Exception.class)
    public UpdateFileDto upload(MultipartFile file, String fileName) throws IOException {
        int uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
                .filter(s -> s.enable(uploadType))
                .findFirst()
                .orElseThrow(() -> new BizException("未找到该类的上传处理器"));
        if (file.isEmpty()){
            throw new BizException("文件不可为空");
        }
        // 上传文件信息
        if (StrUtil.isBlank(fileName)){
            fileName = file.getOriginalFilename();
        }
        String fileType = FileTypeUtil.getType(file.getInputStream());
        String fileSuffix = fileType;

        // 获取不到类型名,后缀名使用上传文件名称的后缀
        if (StrUtil.isBlank(fileSuffix)){
            fileSuffix = StrUtil.subAfter(fileName, ".", true);
        }
        UploadFileContext context = new UploadFileContext()
                .setFileId(IdUtil.getSnowflake().nextId())
                .setFileName(fileName)
                .setFileSuffix(fileSuffix);

        UpdateFileInfo uploadInfo = uploadService.upload(file, context);
        uploadInfo.setFileSuffix(fileSuffix)
                .setFileType(fileType)
                .setFileName(fileName);
        uploadInfo.setId(context.getFileId());
        updateFileManager.save(uploadInfo);
        return uploadInfo.toDto();
    }

    /**
     * 浏览
     */
    public void preview(Long id, HttpServletResponse response){
        int uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
                .filter(s -> s.enable(uploadType))
                .findFirst()
                .orElseThrow(() -> new BizException("未找到该类的上传处理器"));
        UpdateFileInfo updateFileInfo = updateFileManager.findById(id).orElseThrow(() -> new BizException("文件不存在"));
        uploadService.preview(updateFileInfo,response);
    }

    /**
     * 文件下载
     */
    public ResponseEntity<byte[]> download(Long id, HttpServletResponse response){
        int uploadType = fileUploadProperties.getUploadType();
        UploadService uploadService = uploadServices.stream()
                .filter(s -> s.enable(uploadType))
                .findFirst()
                .orElseThrow(() -> new BizException("未找到该类的上传处理器"));
        UpdateFileInfo updateFileInfo = updateFileManager.findById(id).orElseThrow(() -> new BizException("文件不存在"));
        InputStream inputStream = uploadService.download(updateFileInfo, response);
        //设置header信息
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment",
                new String(updateFileInfo.getFileName().getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1));
        return new ResponseEntity<>(IoUtil.readBytes(inputStream),headers, HttpStatus.OK);
    }

    /**
     * 分页
     */
    public PageResult<UpdateFileInfo> page(PageParam pageParam) {
        return MpUtil.page2PageResult(updateFileManager.page(pageParam));
    }

    /**
     * 获取文件地址
     */
    public String getFileUrl(Long id){
        return fileUploadProperties.getServerUrl()+"/file/preview/"+id;
    }

    /**
     * 获取文件地址前缀
     */
    public String getFileUrlPrefix(){
        return fileUploadProperties.getServerUrl()+"/file/preview/";
    }

}
