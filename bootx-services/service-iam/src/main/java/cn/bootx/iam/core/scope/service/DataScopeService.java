package cn.bootx.iam.core.scope.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.dept.event.DeptDeleteEvent;
import cn.bootx.iam.core.scope.dao.DataScopeDeptManager;
import cn.bootx.iam.core.scope.dao.DataScopeManager;
import cn.bootx.iam.core.scope.dao.DataScopeUserManager;
import cn.bootx.iam.core.scope.entity.DataScope;
import cn.bootx.iam.core.scope.entity.DataScopeDept;
import cn.bootx.iam.core.upms.dao.UserDataScopeManager;
import cn.bootx.iam.dto.scope.DataScopeDto;
import cn.bootx.iam.param.scope.DataScopeDeptParam;
import cn.bootx.iam.param.scope.DataScopeParam;
import cn.bootx.starter.data.perm.code.DataScopeEnum;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cn.bootx.iam.code.CachingCode.USER_DATA_SCOPE;

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
        if (userDataScopeManager.existsByDataScopeId(id)){
            throw new BizException("该权限已经有用户在使用，无法删除");
        }
        dataScopeManager.deleteById(id);
        dataScopeUserManager.deleteByDataScopeId(id);
        dataScopeDeptManager.deleteByDataScopeId(id);
    }

    /**
     * 添加部门关联范围权限关系
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = {USER_DATA_SCOPE},allEntries = true)
    public void saveDeptAssign(DataScopeDeptParam param){
        DataScope dataScope = dataScopeManager.findById(param.getDataScopeId()).orElseThrow(DataNotExistException::new);
        val scope = CollUtil.newArrayList(DataScopeEnum.DEPT_SCOPE.getCode(), DataScopeEnum.DEPT_AND_USER_SCOPE.getCode());
        if (!scope.contains(dataScope.getType())){
            throw new BizException("非法操作");
        }

        // 先删后增
        List<DataScopeDept> dateScopedDeptList = dataScopeDeptManager.findByDateScopeId(param.getDataScopeId());
        List<Long> deptIdsByDb = dateScopedDeptList.stream().map(DataScopeDept::getDeptId).collect(Collectors.toList());

        // 要删除的
        List<Long> deptIds = param.getDeptIds();
        List<Long> deleteIds = dateScopedDeptList.stream()
                .filter(dataScopeDept -> !deptIds.contains(dataScopeDept.getDeptId()))
                .map(MpIdEntity::getId)
                .collect(Collectors.toList());
        // 要增加的
        List<DataScopeDept> dataScopeDepths = deptIds.stream()
                .filter(id -> !deptIdsByDb.contains(id))
                .map(deptId -> new DataScopeDept(param.getDataScopeId(), deptId))
                .collect(Collectors.toList());
        dataScopeDeptManager.deleteByIds(deleteIds);
        dataScopeDeptManager.saveAll(dataScopeDepths);
    }

    /**
     * 处理部门被删除的情况
     */
    @EventListener
    public void DeptDeleteEventListener(DeptDeleteEvent event){
        dataScopeDeptManager.deleteByDeptIds(event.getDeptIds());
    }

    /**
     * 获取关联的部门id集合
     */
    public List<Long> findDeptIds(Long id){
        return dataScopeDeptManager.findByDateScopeId(id).stream()
                .map(DataScopeDept::getDeptId)
                .collect(Collectors.toList());
    }

    /**
     * 判断权限编码是否存在
     */
    public boolean existsByCode(String code){
        return dataScopeManager.existsByCode(code);
    }

    /**
     * 判断权限编码是否存在
     */
    public boolean existsByCode(String code,Long id){
        return dataScopeManager.existsByCode(code,id);
    }

    /**
     * name是否存在
     */
    public boolean existsByName(String name){
        return dataScopeManager.existsByName(name);
    }

    /**
     * name是否存在
     */
    public boolean existsByName(String name,Long id){
        return dataScopeManager.existsByName(name,id);
    }

    /**
     * 获取单条
     */
    public DataScopeDto findById(Long id){
       return dataScopeManager.findById(id).map(DataScope::toDto)
               .orElseThrow(() -> new BizException("数据不存在"));
    }

    /**
     * 分页
     */
    public PageResult<DataScopeDto> page(PageParam pageParam, DataScopeParam param){
        return MpUtil.convert2DtoPageResult(dataScopeManager.page(MpUtil.getMpPage(pageParam,DataScope.class)));
    }

    /**
     * 列表查询
     */
    public List<DataScopeDto> findAll(){
        return ResultConvertUtil.dtoListConvert(dataScopeManager.findAll());
    }

}
