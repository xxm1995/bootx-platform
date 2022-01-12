package cn.bootx.starter.file.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.file.dto.UpdateFileDto;
import cn.bootx.starter.file.service.LocalUploadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
* 文件上传
* @author xxm
* @date 2022/1/12
*/
@Tag(name = "文件上传")
@RestController
@RequestMapping("/file/upload")
@RequiredArgsConstructor
public class FIleUpLoadController {
    private final LocalUploadService localUploadService;

    @Operation(summary = "本地存储")
    @PostMapping("/local")
    public ResResult<UpdateFileDto> local(@RequestParam("file") MultipartFile file, String fileName){
        return Res.ok(localUploadService.upload(file,fileName));
    }

    @Operation(summary = "阿里OSS存储")
    @PostMapping("/oss")
    public ResResult<Void> oss(){
        return Res.ok();
    }

    @Operation(summary = "minio存储")
    @PostMapping("/minio")
    public ResResult<Void> minio(){
        return Res.ok();
    }

}
