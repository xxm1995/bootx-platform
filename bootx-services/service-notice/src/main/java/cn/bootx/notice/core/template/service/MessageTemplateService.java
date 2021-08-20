package cn.bootx.notice.core.template.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.notice.core.template.dao.MessageTemplateManager;
import cn.bootx.notice.core.template.entity.MessageTemplate;
import cn.bootx.notice.dto.template.MessageTemplateDto;
import cn.bootx.notice.param.template.MessageTemplateParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.extra.template.Template;
import cn.hutool.extra.template.TemplateEngine;
import cn.hutool.extra.template.TemplateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

/**   
* 消息模板
* @author xxm  
* @date 2021/8/9 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class MessageTemplateService {
    private final MessageTemplateManager messageTemplateManager;

    /**
     * 添加
     */
    public MessageTemplateDto add(MessageTemplateParam param){
        MessageTemplate messageTemplate = MessageTemplate.init(param);
        // code 不重复
        if (messageTemplateManager.existedByCode(messageTemplate.getCode())){
            throw new BizException("模板编码不可重复");
        }
        return messageTemplateManager.save(messageTemplate).toDto();

    }

    /**
     * 更新
     */
    public MessageTemplateDto update(MessageTemplateParam param){
        // code 不重复
        if (messageTemplateManager.existedByCode(param.getCode(), param.getId())){
            throw new BizException("模板编码不可重复");
        }
        MessageTemplate messageTemplate = messageTemplateManager.findById(param.getId())
                .orElseThrow(() -> new BizException("消息模板不存在"));
        BeanUtil.copyProperties(param,messageTemplate, CopyOptions.create().ignoreNullValue());
        return messageTemplateManager.updateById(messageTemplate).toDto();
    }

    /**
     * 分页
     */
    public PageResult<MessageTemplateDto> page(PageParam pageParam){
        return MpUtils.convert2PageResult(messageTemplateManager.page(pageParam));
    }

    /**
     * 获取详情
     */
    public MessageTemplateDto findById(Long id){
        return messageTemplateManager.findById(id).map(MessageTemplate::toDto).orElse(null);
    }

    /**
     * 渲染
     */
    public String rendering(String code, Map<String,String> paramMap){
        MessageTemplate messageTemplate = messageTemplateManager.findByCode(code)
                .orElseThrow(() -> new BizException("消息模板不存在"));
        String date = messageTemplate.getDate();
        TemplateEngine engine = TemplateUtil.createEngine();
        Template template = engine.getTemplate(date);
        return template.render(paramMap);
    }
}
