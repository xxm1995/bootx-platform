package cn.bootx.baseapi.core.parameter.service;

import cn.bootx.baseapi.core.parameter.dao.SystemParamManager;
import cn.bootx.baseapi.core.parameter.entity.SystemParameter;
import cn.bootx.baseapi.dto.parameter.SystemParameterDto;
import cn.bootx.baseapi.param.system.SystemParameterParam;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.function.ParamService;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
* 系统参数
* @author xxm  
* @date 2021/10/25 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class SystemParamService implements ParamService {
    private final SystemParamManager systemParamManager;

    /**
     * 添加
     */
    public void add(SystemParameterParam param){
        SystemParameter systemParameter = SystemParameter.init(param);
        if (systemParamManager.existedByKey(systemParameter.getParamKey())){
            throw new BizException("key重复");
        }
        // 默认非内置
        systemParameter.setInternal(false);
        systemParamManager.save(systemParameter);
    }

    /**
     * 更新
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(SystemParameterParam param) {
        SystemParameter systemParameter = systemParamManager.findById(param.getId())
                .orElseThrow(() -> new BizException("参数项不存在"));

        if (systemParamManager.existedByKey(param.getParamKey(),param.getId())) {
            throw new BizException("key重复");
        }
        BeanUtil.copyProperties(param,systemParameter, CopyOptions.create().ignoreNullValue());
        systemParamManager.updateById(systemParameter);
    }

    /**
     * 分页
     */
    public PageResult<SystemParameterDto> page(PageParam pageParam, SystemParameterParam param) {
        return MpUtil.convert2DtoPageResult(systemParamManager.page(pageParam,param));
    }

    /**
     * 获取单条
     */
    public SystemParameterDto findById(Long id){
       return systemParamManager.findById(id).map(SystemParameter::toDto)
               .orElseThrow(DataNotExistException::new);
    }

    /**
     * 根据key获取单条
     */
    public String get(String key) {
        return systemParamManager.findByParamKey(key).map(SystemParameter::getValue)
                .orElse(null);
    }

    /**
     * 根据键名获取键值
     */
    public String findByParamKey(String key) {
        return systemParamManager.findByParamKey(key).map(SystemParameter::getValue)
                .orElseThrow(DataNotExistException::new);
    }

    /**
     * 删除
     */
    public void delete(Long id) {
        SystemParameter systemParameter = systemParamManager.findById(id).orElseThrow(() -> new BizException("系统参数不存在"));
        if (systemParameter.isInternal()){
            throw new BizException("内置参数不可以被删除");
        }
        systemParamManager.deleteById(id);
    }

    /**
     * 判断编码是否存在
     */
    public boolean existsByKey(String key){
        return systemParamManager.existedByKey(key);
    }

    /**
     * 判断编码是否存在
     */
    public boolean existsByKey(String key,Long id){
        return systemParamManager.existedByKey(key,id);
    }

    /**
     * 获取参数值
     */
    @Override
    public String getValue(String key) {
        return systemParamManager.findByParamKey(key).map(SystemParameter::getValue).orElse(null);
    }
}
