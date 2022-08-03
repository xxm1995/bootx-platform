package cn.bootx.starter.wechat.core.notice.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.wechat.core.notice.entity.WeChatTemplate;
import cn.bootx.starter.wechat.param.notice.WeChatTemplateParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
*
* @author xxm
* @date 2022/7/17
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class WeChatTemplateManager extends BaseManager<WeChatTemplateMapper, WeChatTemplate> {

    public Page<WeChatTemplate> page(PageParam pageParam, WeChatTemplateParam param) {
        Page<WeChatTemplate> mpPage = MpUtil.getMpPage(pageParam, WeChatTemplate.class);
        return this.lambdaQuery()
                .select(WeChatTemplate.class, MpUtil::excludeBigField)
                .like(StrUtil.isNotBlank(param.getTemplateId()), WeChatTemplate::getTemplateId,param.getTemplateId())
                .like(StrUtil.isNotBlank(param.getName()), WeChatTemplate::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getCode()), WeChatTemplate::getCode,param.getCode())
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }

    public boolean existsByCode(String code,Long id){
        return existedByField(WeChatTemplate::getCode,code,id);
    }
}
