package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.dto.KeyValue;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.iam.core.upms.dao.RoleManager;
import cn.bootx.iam.core.upms.dao.UserRoleManager;
import cn.bootx.iam.core.upms.entity.Role;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.exception.role.RoleAlreadyExistedException;
import cn.bootx.iam.exception.role.RoleAlreadyUsedException;
import cn.bootx.iam.exception.role.RoleNotExistedException;
import cn.bootx.iam.param.upms.RoleParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**   
* 角色
* @author xxm  
* @date 2021/8/3 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class RoleService {
    private final RoleManager roleManager;
    private final UserRoleManager userRoleManager;

    /**
     * 添加
     */
    @Transactional(rollbackFor = Exception.class)
    public RoleDto add(RoleParam roleParam){
        //Name唯一性校验（名称code不能相同）
        if (roleManager.existsByCode(roleParam.getCode())){
            throw new RoleAlreadyExistedException();
        }
        if (roleManager.existsByName(roleParam.getName())){
            throw new RoleAlreadyExistedException();
        }
        Role role = Role.init(roleParam);
        return roleManager.save(role).toDto();
    }

    /**
     * 修改
     */
    @Transactional(rollbackFor = Exception.class)
    public RoleDto update(RoleParam roleParam){
        Long id = roleParam.getId();

        //name和code唯一性校验（同一个租户下名称code不能相同）
        if (roleManager.existsByCode(roleParam.getCode(),id)){
            throw new RoleAlreadyExistedException();
        }
        if (roleManager.existsByName(roleParam.getName(),id)){
            throw new RoleAlreadyExistedException();
        }

        Role role = roleManager.findById(id).orElseThrow(RoleNotExistedException::new);
        BeanUtil.copyProperties(roleParam,role, CopyOptions.create().ignoreNullValue());

        return roleManager.updateById(role).toDto();
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long roleId){
        if (Objects.isNull(roleId) || !roleManager.existsById(roleId)){
            throw new RoleNotExistedException();
        }
        // 存在当前角色用户的场合不允许删除
        if (userRoleManager.existsByRoleId(roleId)) {
            throw new RoleAlreadyUsedException();
        }
        // 删除角色信息
        roleManager.deleteById(roleId);
    }

    /**
     * 角色列表
     */
    public List<RoleDto> findAll(){
        return ResultConvertUtils.dtoListConvert(roleManager.findAll());
    }

    /**
     * 角色分页
     */
    public PageResult<RoleDto> page(PageParam pageParam){
        return MpUtils.convert2PageResult(roleManager.page(pageParam));
    }


    /**
     * 角色下拉框
     */
    public List<KeyValue> dropdown(){
        return roleManager.findDropdown();
    }

    /**
     * 详情
     */
    public RoleDto findById(Long id) {
        return ResultConvertUtils.dtoConvert(roleManager.findById(id));
    }

    /**
     * code是否存在
     */
    public boolean existsByCode(String code){
        return roleManager.existsByCode(code);
    }
    /**
     * code是否存在
     */
    public boolean existsByCode(String code,Long id){
        return roleManager.existsByCode(code,id);
    }

    /**
     * name是否存在
     */
    public boolean existsByName(String name){
        return roleManager.existsByName(name);
    }

    /**
     * name是否存在
     */
    public boolean existsByName(String name,Long id){
        return roleManager.existsByName(name,id);
    }
}
