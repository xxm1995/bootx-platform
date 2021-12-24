package cn.bootx.iam.core.scope.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.code.DataScopeCode;
import cn.bootx.iam.core.scope.dao.DataScopeDeptManager;
import cn.bootx.iam.core.scope.dao.DataScopeManager;
import cn.bootx.iam.core.scope.dao.DataScopeUserManager;
import cn.bootx.iam.core.scope.entity.DataScope;
import cn.bootx.iam.core.scope.entity.DataScopeDept;
import cn.bootx.iam.core.scope.entity.DataScopeUser;
import cn.bootx.iam.core.upms.dao.UserDataScopeManager;
import cn.bootx.iam.dto.scope.DataScopeDto;
import cn.bootx.iam.param.scope.DataScopeDeptParam;
import cn.bootx.iam.param.scope.DataScopeParam;
import cn.bootx.iam.param.scope.DataScopeUserParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**   
* 数据范围权限
* @author xxm  
* @date 2021/12/24 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DataScopeService {
    private final DataScopeManager dataScopeManager;
    private final DataScopeUserManager dataScopeUserManager;
    private final DataScopeDeptManager dataScopeDeptManager;
    private final UserDataScopeManager userDataScopeManager;

    /**
     * 添加数据范围权限
     */
    @Transactional(rollbackFor = Exception.class)
    public void add(DataScopeParam param){
        DataScope dataScope = DataScope.init(param);
        dataScopeManager.save(dataScope);
    }


    /**
     * 修改
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(DataScopeParam param){
        DataScope dataScope = dataScopeManager.findById(param.getId()).orElseThrow(() -> new BizException("数据不存在"));
        BeanUtil.copyProperties(param,dataScope, CopyOptions.create().ignoreNullValue());
        dataScope.setType(null);
        dataScopeManager.updateById(dataScope);
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        if (!dataScopeManager.existedById(id)){
            throw new BizException("数据不存在");
        }
        if (userDataScopeManager.existedByDataScopeIdd(id)){
            throw new BizException("该权限已经有用户在使用，无法删除");
        }
        dataScopeManager.deleteById(id);
        dataScopeUserManager.deleteByDataScopeId(id);
        dataScopeDeptManager.deleteByDataScopeId(id);
    }

    /**
     * 添加用户范围权限关联关系
     */
    @Transactional(rollbackFor = Exception.class)
    public void editDataScopeUser(DataScopeUserParam param){
        DataScope dataScope = dataScopeManager.findById(param.getDataScopeId()).orElseThrow(() -> new BizException("数据不存在"));
        if (!Objects.equals(dataScope.getType(), DataScopeCode.DEPT_AND_USER_SCOPE) &&  Objects.equals(dataScope.getType(), DataScopeCode.DEPT_AND_USER_SCOPE)){
            throw new BizException("非法操作");
        }
        // 删除
        dataScopeUserManager.deleteByIds(param.getDeleteIds());
        // 添加
        if (CollUtil.isEmpty(param.getAddUserIds())){
            List<DataScopeUser> dataScopeUsers = param.getAddUserIds().stream()
                    .map(userId -> new DataScopeUser(param.getDataScopeId(), userId))
                    .collect(Collectors.toList());
            dataScopeUserManager.saveAll(dataScopeUsers);
        }
    }

    /**
     * 添加部门关联范围权限关系
     */
    @Transactional(rollbackFor = Exception.class)
    public void addDataScopeUser(DataScopeDeptParam param){
        DataScope dataScope = dataScopeManager.findById(param.getDataScopeId()).orElseThrow(() -> new BizException("数据不存在"));
        if (!Objects.equals(dataScope.getType(), DataScopeCode.DEPT_SCOPE) &&  Objects.equals(dataScope.getType(), DataScopeCode.DEPT_AND_USER_SCOPE)){
            throw new BizException("非法操作");
        }

        dataScopeDeptManager.deleteByDataScopeId(param.getDataScopeId());
        List<DataScopeDept> dataScopeDepths = param.getUserIds().stream()
                .map(userId -> new DataScopeDept(param.getDataScopeId(), userId))
                .collect(Collectors.toList());
        dataScopeDeptManager.saveAll(dataScopeDepths);
    }

    /**
     * 分页
     */
    public PageResult<DataScopeDto> page(PageParam pageParam, DataScopeParam param){
        return MpUtil.convert2PageResult(dataScopeManager.page(MpUtil.getMpPage(pageParam,DataScope.class)));
    }

    /**
     * 列表查询
     */
    public List<DataScopeDto> list(){
        return ResultConvertUtil.dtoListConvert(dataScopeManager.findAll());
    }

}
