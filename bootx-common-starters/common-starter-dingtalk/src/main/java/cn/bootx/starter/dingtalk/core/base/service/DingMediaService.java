package cn.bootx.starter.dingtalk.core.base.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.FileUtil;
import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.starter.dingtalk.code.DingTalkCode;
import cn.bootx.starter.dingtalk.core.base.domin.UploadMedia;
import cn.bootx.starter.dingtalk.core.base.result.MediaResult;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.Objects;

import static cn.bootx.starter.dingtalk.code.DingTalkCode.SUCCESS_CODE;

/**   
 * 钉钉媒体文件管理
 * @author xxm  
 * @date 2022/7/25 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DingMediaService {
    private final DingAccessService dingAccessService;

    /**
     * 文件上传
     */
    @SneakyThrows
    public String uploadMedia(UploadMedia uploadMedia){
        File tmpFile = FileUtil.createTempFile(uploadMedia.getInputStream(), IdUtil.getSnowflakeNextIdStr(), uploadMedia.getFileType());
        String body = HttpUtil.createPost(StrUtil.format(DingTalkCode.MEDIA_UPLOAD_URL, dingAccessService.getAccessToken()))
                .form(DingTalkCode.MEDIA, tmpFile)
                .form("type", uploadMedia.getMediaType())
                .execute()
                .body();
        MediaResult mediaResult = JacksonUtil.toBean(body, MediaResult.class);
        if (!Objects.equals(mediaResult.getCode(),SUCCESS_CODE)){
            throw new BizException(mediaResult.getMsg());
        }
        return mediaResult.getMediaId();
    }
}
