package cn.bootx.notice.core.dingtalk.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.notice.core.dingtalk.dao.DingRobotConfigManage;
import cn.bootx.notice.core.dingtalk.entity.DingRobotConfig;
import cn.bootx.notice.dto.dingtalk.DingRobotConfigDto;
import cn.bootx.notice.exception.MailConfigNotExistException;
import cn.bootx.notice.param.dingtalk.DingRobotConfigParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 钉钉机器人消息发送
 * @author xxm
 * @date 2020/11/29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DingRobotConfigService {

    private final DingRobotConfigManage dingRobotConfigManage;

    /**
     * 添加新配置
     */
    @Transactional(rollbackFor = Exception.class)
    public DingRobotConfigDto add(DingRobotConfigParam param) {
        if (dingRobotConfigManage.existsByCode(param.getCode())) {
            throw new BizException("code重复");
        }

        DingRobotConfig dingRobotConfig = DingRobotConfig.init(param);

        return dingRobotConfigManage.save(dingRobotConfig).toDto();
    }

    /**
     * 更新钉钉机器人配置
     */
    @Transactional(rollbackFor = Exception.class)
    public DingRobotConfigDto update(DingRobotConfigParam param) {
        DingRobotConfig dingRobotConfig = dingRobotConfigManage.findById(param.getId()).orElseThrow(MailConfigNotExistException::new);
        BeanUtil.copyProperties(param,dingRobotConfig, CopyOptions.create().ignoreNullValue());
        return dingRobotConfigManage.updateById(dingRobotConfig).toDto();
    }

    /**
     * 获取所有配置
     */
    public List<DingRobotConfigDto> findAll(){
        return ResultConvertUtil.dtoListConvert(dingRobotConfigManage.findAll());
    }


    /**
     * 获取所有配置
     */
    public PageResult<DingRobotConfigDto> page(PageParam pageParam){
        return MpUtil.convert2PageResult(dingRobotConfigManage.page(pageParam));
    }

    /**
     * 根据 id 获取相应的配置
     */
    public DingRobotConfigDto findById(Long id) {
        return ResultConvertUtil.dtoConvert(dingRobotConfigManage.findById(id));
    }


    /**
     * 根据 id 删除相应的邮箱配置
     */
    public void delete(Long id) {
        dingRobotConfigManage.deleteById(id);
    }

    /**
     * 编码是否已经存在
     */
    public boolean existsByCode(String code){
        return dingRobotConfigManage.existsByCode(code);
    }

    /**
     * 编码是否已经存在(不包含自身)
     */
    public boolean existsByCode(String code,Long id){
        return dingRobotConfigManage.existsByCode(code,id);
    }
}
