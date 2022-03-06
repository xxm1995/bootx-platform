package cn.bootx.baseapi.core.config.dao;

import cn.bootx.baseapi.core.config.entity.SystemParameter;
import cn.bootx.baseapi.param.system.SystemParameterParam;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**   
* 系统参数
* @author xxm  
* @date 2021/10/25 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class SystemParamManager extends BaseManager<SystemParamMapper, SystemParameter> {

    /**
     * key重复检查
     */
    public boolean existedByKey(String key){
        return existedByField(SystemParameter::getParamKey,key);
    }
    /**
     * key重复检查
     */
    public boolean existedByKey(String key,Long id){
        return existedByField(SystemParameter::getParamKey,key,id);
    }

    /**
     * 分页
     */
    public Page<SystemParameter> page(PageParam pageParam, SystemParameterParam param){
        Page<SystemParameter> mpPage = MpUtil.getMpPage(pageParam, SystemParameter.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .like(StrUtil.isNotBlank(param.getName()),SystemParameter::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getParamKey()),SystemParameter::getParamKey,param.getParamKey())
                .page(mpPage);
    }

    public Optional<SystemParameter> findByParamKey(String key) {
        return this.findByField(SystemParameter::getParamKey,key);
    }
}
