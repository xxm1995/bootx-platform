package cn.bootx.starter.wecom.core.robot.executor;

import cn.hutool.core.io.resource.InputStreamResource;
import cn.hutool.core.io.resource.Resource;
import cn.hutool.http.HttpUtil;
import me.chanjar.weixin.common.bean.result.WxMediaUploadResult;
import me.chanjar.weixin.common.enums.WxType;
import me.chanjar.weixin.common.error.WxError;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.common.util.http.RequestExecutor;
import me.chanjar.weixin.common.util.http.ResponseHandler;

import java.io.IOException;
import java.io.InputStream;

/**
 * 机器人文件素材上传
 * @author xxm  
 * @date 2022/7/23 
 */
public class RobotMediaFileUploadRequestExecutor implements RequestExecutor<WxMediaUploadResult, InputStream> {
    @Override
    public WxMediaUploadResult execute(String uri, InputStream data, WxType wxType) throws WxErrorException, IOException {
        Resource resource = new InputStreamResource(data);
        String response = HttpUtil.createPost(uri)
                .form("filename","")
                .form("filelength","")
                .form("content-type","")
                .form("media",resource)
                .execute()
                .body();

        WxError result = WxError.fromJson(response);
        if (result.getErrorCode() != 0) {
            throw new WxErrorException(result);
        }
        return WxMediaUploadResult.fromJson(response);
    }

    @Override
    public void execute(String uri, InputStream data, ResponseHandler<WxMediaUploadResult> handler, WxType wxType) throws WxErrorException, IOException {
        handler.handle(this.execute(uri, data, wxType));
    }
}
