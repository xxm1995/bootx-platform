package cn.bootx.baseapi.core.config.service;

import cn.bootx.baseapi.core.config.dao.SystemParamManager;
import cn.bootx.baseapi.core.config.entity.SystemParameter;
import cn.bootx.baseapi.dto.system.SystemParameterDto;
import cn.bootx.baseapi.param.system.SystemParameterParam;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
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
public class SystemParamService {

    private final SystemParamManager systemParamManager;

    /**
     * 添加
     */
    public void add(SystemParameterParam param){
        SystemParameter systemParameter = SystemParameter.init(param);
        if (systemParamManager.existedByKey(systemParameter.getParamKey())){
            throw new BizException("key重复");
        }
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
        systemParamManager.updateById(systemParameter);
    }

    /**
     * 分页
     */
    public PageResult<SystemParameterDto> page(PageParam pageParam, SystemParameterParam param) {
        return MpUtil.convert2PageResult(systemParamManager.page(pageParam,param));
    }

    /**
     * 获取单条
     */
    public SystemParameterDto findById(Long id){
       return systemParamManager.findById(id).map(SystemParameter::toDto)
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


}
