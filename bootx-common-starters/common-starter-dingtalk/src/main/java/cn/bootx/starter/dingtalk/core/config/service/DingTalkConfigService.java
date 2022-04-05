package cn.bootx.starter.dingtalk.core.config.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.dingtalk.core.config.dao.DingTalkConfigManager;
import cn.bootx.starter.dingtalk.core.config.entity.DingTalkConfig;
import cn.bootx.starter.dingtalk.dto.config.DingTalkConfigDto;
import cn.bootx.starter.dingtalk.param.config.DingTalkConfigParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**   
* 钉钉配置
* @author xxm  
* @date 2022/4/2 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DingTalkConfigService {
    private final DingTalkConfigManager dingTalkConfigManager;


    /**
     * 添加新配置
     */
    @Transactional(rollbackFor = Exception.class)
    public DingTalkConfigDto add(DingTalkConfigParam param) {
        DingTalkConfig dingTalkConfig = DingTalkConfig.init(param);
        dingTalkConfig.setEnable(false);
        return dingTalkConfigManager.save(dingTalkConfig).toDto();
    }

    /**
     * 更新钉钉机器人配置
     */
    @Transactional(rollbackFor = Exception.class)
    public DingTalkConfigDto update(DingTalkConfigParam param) {
        DingTalkConfig dingTalkConfig = dingTalkConfigManager.findById(param.getId()).orElseThrow(DataNotExistException::new);
        BeanUtil.copyProperties(param,dingTalkConfig, CopyOptions.create().ignoreNullValue());
        return dingTalkConfigManager.updateById(dingTalkConfig).toDto();
    }

    /**
     * 设置启用的配置
     */
    @Transactional(rollbackFor = Exception.class)
    public void setEnable(Long id){
        DingTalkConfig dingTalkConfig = dingTalkConfigManager.findById(id).orElseThrow(DataNotExistException::new);
        if (Objects.equals(dingTalkConfig.getEnable(),Boolean.TRUE)){
            return;
        }
        dingTalkConfigManager.removeAllEnable();
        dingTalkConfig.setEnable(true);
        dingTalkConfigManager.updateById(dingTalkConfig);
    }

    /**
     * 清除启用状态
     */
    @Transactional(rollbackFor = Exception.class)
    public void clearEnable(Long id){
        DingTalkConfig dingTalkConfig = dingTalkConfigManager.findById(id).orElseThrow(DataNotExistException::new);
        if (Objects.equals(dingTalkConfig.getEnable(),Boolean.FALSE)){
            return;
        }
        dingTalkConfig.setEnable(false);
        dingTalkConfigManager.updateById(dingTalkConfig);
    }

    /**
     * 获取所有配置
     */
    public List<DingTalkConfigDto> findAll(){
        return ResultConvertUtil.dtoListConvert(dingTalkConfigManager.findAll());
    }


    /**
     * 获取所有配置
     */
    public PageResult<DingTalkConfigDto> page(PageParam pageParam,DingTalkConfigParam param){
        return MpUtil.convert2DtoPageResult(dingTalkConfigManager.page(pageParam,param));
    }

    /**
     * 根据 id 获取相应的配置
     */
    public DingTalkConfigDto findById(Long id) {
        return dingTalkConfigManager.findById(id).map(DingTalkConfig::toDto).orElseThrow(DataNotExistException::new);
    }


    /**
     * 根据 id 删除相应的机器人配置
     */
    public void delete(Long id) {
        dingTalkConfigManager.deleteById(id);
    }
}
