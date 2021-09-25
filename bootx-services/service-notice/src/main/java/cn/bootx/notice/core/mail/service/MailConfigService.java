package cn.bootx.notice.core.mail.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.notice.core.mail.dao.MailConfigManager;
import cn.bootx.notice.core.mail.entity.MailConfig;
import cn.bootx.notice.dto.mail.MailConfigDto;
import cn.bootx.notice.exception.DefaultMailConfigAlreadyExistedException;
import cn.bootx.notice.exception.MailConfigCodeAlreadyExistedException;
import cn.bootx.notice.exception.MailConfigNotExistException;
import cn.bootx.notice.param.mail.MailConfigParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * 邮件配置
 * @author xxm
 * @date 2020/4/8 13:29
 */
@Service
@AllArgsConstructor
public class MailConfigService {
    private final MailConfigManager mailConfigManager;

    /**
     * 添加新邮箱配置
     */
    @Transactional(rollbackFor = Exception.class)
    public MailConfigDto add(MailConfigParam param) {
        if (mailConfigManager.existsByCode(param.getCode())) {
            throw new MailConfigCodeAlreadyExistedException();
        }

        // 只能有一个配置处于活动状态
        if(Objects.equals(param.getActivity(),Boolean.TRUE) && mailConfigManager.existsByActivity()) {
            throw new DefaultMailConfigAlreadyExistedException();
        }

        MailConfig mailConfig = MailConfig.init(param);

        return mailConfigManager.save(mailConfig).toDto();
    }

    /**
     * 更新邮箱配置
     */
    @Transactional(rollbackFor = Exception.class)
    public MailConfigDto update(MailConfigParam param) {
        MailConfig mailConfig = mailConfigManager.findById(param.getId()).orElseThrow(MailConfigNotExistException::new);
        BeanUtil.copyProperties(param,mailConfig, CopyOptions.create().ignoreNullValue());
        return mailConfigManager.updateById(mailConfig).toDto();
    }

    /**
     * 获取所有邮箱配置
     */
    public List<MailConfigDto> findAll() {
        return ResultConvertUtils.dtoListConvert(mailConfigManager.findAll());
    }

    /**
     * 根据 id 获取相应的邮箱配置
     */
    public MailConfigDto findById(Long id) {
        return ResultConvertUtils.dtoConvert(mailConfigManager.findById(id));
    }

    /**
     * 获取 默认邮箱配置
     */
    public MailConfigDto getDefaultConfig() {
        return ResultConvertUtils.dtoConvert(mailConfigManager.findByActivity());
    }

    /**
     * 分页
     */
    public PageResult<MailConfigDto> page(PageParam pageParam,MailConfigParam param){
        return MpUtils.convert2PageResult(mailConfigManager.page(pageParam,param));
    }

    /**
     * 根据 code 获取相应的邮箱配置
     */
    public MailConfigDto getByCode(String code) {
        return ResultConvertUtils.dtoConvert(mailConfigManager.findByCode(code));
    }

    /**
     * 编码是否已经存在
     */
    public boolean existsByCode(String code){
        return mailConfigManager.existsByCode(code);
    }

    /**
     * 编码是否已经存在(不包含自身)
     */
    public boolean existsByCode(String code,Long id){
        return mailConfigManager.existsByCode(code,id);
    }



    /**
     * 设置活动邮箱
     */
    @Transactional(rollbackFor = Exception.class)
    public void setUpActivity(Long id){
        MailConfig mailConfig = mailConfigManager.findById(id).orElseThrow(MailConfigNotExistException::new);
        mailConfig.setActivity(true);
        mailConfigManager.removeAllActivity();
        mailConfigManager.updateById(mailConfig);
    }

    /**
     * 根据 id 删除相应的邮箱配置
     */
    public void delete(Long id) {
        mailConfigManager.deleteById(id);
    }
}
