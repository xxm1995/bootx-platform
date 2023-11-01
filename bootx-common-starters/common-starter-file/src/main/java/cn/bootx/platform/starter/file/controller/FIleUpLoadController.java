package cn.bootx.platform.starter.file.controller;

import cn.bootx.platform.common.core.annotation.IgnoreAuth;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.starter.file.dto.UpLoadOptions;
import cn.bootx.platform.starter.file.dto.UpdateFileDto;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.starter.file.service.FileUploadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 文件上传
 *
 * @author xxm
 * @since 2022/1/12
 */
@IgnoreAuth
@Tag(name = "文件上传")
@RestController
@RequestMapping("/file")
@RequiredArgsConstructor
public class FIleUpLoadController {

    private final FileUploadService uploadService;
    private final FileStorageService fileStorageService;

    @IgnoreAuth(ignore = false)
    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<UpdateFileDto>> page(PageParam pageParam) {
        return Res.ok(uploadService.page(pageParam));
    }
    @PostMapping("/upload")
    public ResResult<Void> upload(MultipartFile file) {
        FileInfo fileInfo = fileStorageService.of(file)
                .setPath("upload/") //保存到相对路径下，为了方便管理，不需要可以不写
                .setObjectId("0")   //关联对象id，为了方便管理，不需要可以不写
                .setObjectType("0") //关联对象类型，为了方便管理，不需要可以不写
                .putAttr("role","admin") //保存一些属性，可以在切面、保存上传记录、自定义存储平台等地方获取使用，不需要可以不写
                .upload();  //将文件上传到对应地方
        return Res.ok();
    }

    @IgnoreAuth(ignore = false, login = true)
    @Operation(summary = "上传")
    @PostMapping("/upload")
    public ResResult<UpdateFileDto> local(MultipartFile file, String fileName) throws IOException {
        return Res.ok(uploadService.upload(file, fileName));
    }

    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id) {
        uploadService.delete(id);
        return Res.ok();
    }

    @Operation(summary = "获取文件预览地址")
    @GetMapping("getFilePreviewUrl")
    public ResResult<String> getFilePreviewUrl(Long id) {
        return Res.ok(uploadService.getFilePreviewUrl(id));
    }

    @Operation(summary = "获取文件预览地址前缀")
    @GetMapping("getFilePreviewUrlPrefix")
    public ResResult<String> getFilePreviewUrlPrefix() {
        return Res.ok(uploadService.getFilePreviewUrlPrefix());
    }

    @Operation(summary = "获取文件下载地址")
    @GetMapping("getFileDownloadUrl")
    public ResResult<String> getFileDownloadUrl(Long id) {
        return Res.ok(uploadService.getFileDownloadUrl(id));
    }

    @Operation(summary = "预览文件")
    @GetMapping("/preview/{id}")
    public void preview(@PathVariable Long id, HttpServletResponse response) {
        uploadService.preview(id, response);
    }

    @Operation(summary = "下载文件")
    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> download(@PathVariable Long id) {
        return uploadService.download(id);
    }

    @Operation(summary = "获取临时oss密钥")
    @GetMapping("/getUpLoadOptions")
    public ResResult<UpLoadOptions> getTempCredentials() {
        return Res.ok(uploadService.getTempCredentials());
    }
    @Operation(summary = "保存记录")
    @PostMapping("/saveUploadResult")
    public ResResult<UpdateFileDto> saveUploadResult(@RequestBody UpdateFileInfo info) {
        return Res.ok(uploadService.saveUploadResult(info));
    }



}
