package cn.bootx.starter.file.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.file.dto.UpdateFileDto;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**   
* 上传文件本地存储
* @author xxm  
* @date 2022/1/12 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class LocalUploadService {


    /**
     * 文件上传
     * @param file
     * @param fileName
     */
    @SneakyThrows
    public UpdateFileDto upload(MultipartFile file, String fileName){
        if (file.isEmpty()){
            throw new BizException("文件不可为空");
        }

        if (StrUtil.isBlank(fileName)){
            fileName = file.getOriginalFilename();
        }
        String storeName = "d://data/file/"+IdUtil.getSnowflake().nextIdStr()+"."+file.getOriginalFilename();
        FileUtil.writeFromStream(file.getInputStream(),storeName);
        return new UpdateFileDto();
    }
}
