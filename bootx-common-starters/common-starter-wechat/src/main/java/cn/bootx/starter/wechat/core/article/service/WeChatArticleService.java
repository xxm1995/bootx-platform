package cn.bootx.starter.wechat.core.article.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.freepublish.WxMpFreePublishItem;
import org.springframework.stereotype.Service;

/**
 *
 * @author xxm
 * @date 2022/8/11
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatArticleService {
    private final WxMpService wxMpService;


    /**
     * 查询图文
     *
     * @return
     */
    @SneakyThrows
    public PageResult<WxMpFreePublishItem> page(PageParam pageParam){
        val freePublishService = wxMpService.getFreePublishService();
        val result = freePublishService.getPublicationRecords(pageParam.start(), pageParam.getSize());
        val items = result.getItems();;
        PageResult<WxMpFreePublishItem> pageResult = new PageResult<>();
        pageResult.setCurrent(pageParam.getCurrent())
                .setRecords(items)
                .setSize(pageParam.getSize())
                .setTotal(result.getTotalCount());
        return pageResult;
    }

}
