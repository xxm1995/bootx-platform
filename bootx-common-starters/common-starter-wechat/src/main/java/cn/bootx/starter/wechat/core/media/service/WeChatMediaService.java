package cn.bootx.starter.wechat.core.media.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.hutool.core.io.FileTypeUtil;
import cn.hutool.core.io.IoUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.mp.api.WxMpMaterialService;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.material.WxMpMaterialFileBatchGetResult;
import me.chanjar.weixin.mp.bean.material.WxMpMaterialFileBatchGetResult.WxMaterialFileBatchGetNewsItem;
import me.chanjar.weixin.mp.bean.material.WxMpMaterialNewsBatchGetResult.WxMaterialNewsBatchGetNewsItem;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;

/**   
 * 素材管理
 * @author xxm  
 * @date 2022/8/9 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatMediaService {
    private final WxMpService wxMpService;

    /**
     * 分页查询
     */
    @SneakyThrows
    public PageResult<WxMaterialFileBatchGetNewsItem> pageFile(PageParam pageParam, String type){
        WxMpMaterialService materialService = wxMpService.getMaterialService();
        WxMpMaterialFileBatchGetResult result = materialService.materialFileBatchGet(type, pageParam.start(), pageParam.getSize());
        val items = result.getItems();;
        PageResult<WxMaterialFileBatchGetNewsItem> pageResult = new PageResult<>();
        pageResult.setCurrent(pageParam.getCurrent())
                .setRecords(items)
                .setSize(pageParam.getSize())
                .setTotal(result.getTotalCount());
        return pageResult;
    }

    /**
     * 分页查询(图文)
     */
    @SneakyThrows
    public PageResult<WxMaterialNewsBatchGetNewsItem> pageNews(PageParam pageParam){
        WxMpMaterialService materialService = wxMpService.getMaterialService();
        val result = materialService.materialNewsBatchGet( pageParam.start(), pageParam.getSize());
        val items = result.getItems();
        PageResult<WxMaterialNewsBatchGetNewsItem> pageResult = new PageResult<>();
        pageResult.setCurrent(pageParam.getCurrent())
                .setRecords(items)
                .setSize(pageParam.getSize())
                .setTotal(result.getTotalCount());
        return pageResult;
    }

    /**
     * 删除素材
     */
    @SneakyThrows
    public void deleteFile(String mediaId){
        WxMpMaterialService materialService = wxMpService.getMaterialService();
        materialService.materialDelete(mediaId);
    }

    /**
     * 上传 非图文素材
     * @see WxConsts.MediaFileType
     */
    @SneakyThrows
    public void uploadFile(String mediaType, MultipartFile multipartFile){
        WxMpMaterialService materialService = wxMpService.getMaterialService();
        byte[] bytes = IoUtil.readBytes(multipartFile.getInputStream());
        String fileType = FileTypeUtil.getType(new ByteArrayInputStream(bytes));
        materialService.mediaUpload(mediaType,fileType,new ByteArrayInputStream(bytes));
    }

}
