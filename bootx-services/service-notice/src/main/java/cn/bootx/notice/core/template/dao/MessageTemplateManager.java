package cn.bootx.notice.core.template.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.notice.core.template.entity.MessageTemplate;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**   
* 消息模板
* @author xxm  
* @date 2021/8/9 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class MessageTemplateManager extends BaseManager<MessageTemplateMapper, MessageTemplate> {

    public Optional<MessageTemplate> findByCode(String code){
        return findByField(MessageTemplate::getCode,code);
    }

    public boolean existedByCode(String code){
        return existedByField(MessageTemplate::getCode,code);
    }

    public boolean existedByCode(String code,Long id){
        return lambdaQuery().eq(MessageTemplate::getCode, code)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public Page<MessageTemplate> page(PageParam pageParam) {
        Page<MessageTemplate> mpPage = MpUtils.getMpPage(pageParam, MessageTemplate.class);
        return lambdaQuery().page(mpPage);
    }
}
