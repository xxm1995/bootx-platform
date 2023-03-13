package cn.bootx.iam.core.role.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.dto.KeyValue;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.role.dao.RoleManager;
import cn.bootx.iam.core.role.entity.Role;
import cn.bootx.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.iam.core.upms.dao.RolePathManager;
import cn.bootx.iam.core.upms.dao.UserRoleManager;
import cn.bootx.iam.dto.role.RoleDto;
import cn.bootx.iam.exception.role.RoleAlreadyExistedException;
import cn.bootx.iam.exception.role.RoleAlreadyUsedException;
import cn.bootx.iam.exception.role.RoleNotExistedException;
import cn.bootx.iam.param.role.RoleParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

import static cn.bootx.iam.code.CachingCode.USER_PATH;

/**
 * 角色
 *
 * @author xxm
 * @date 2021/8/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RoleService {

    private final RoleManager roleManager;

    private final UserRoleManager userRoleManager;

    private final RolePathManager rolePathManager;

    private final RoleMenuManager roleMenuManager;

    /**
     * 添加
     */
    @Transactional(rollbackFor = Exception.class)
    public RoleDto add(RoleParam roleParam) {
        // Name唯一性校验（名称code不能相同）
        if (roleManager.existsByCode(roleParam.getCode())) {
            throw new RoleAlreadyExistedException();
        }
        if (roleManager.existsByName(roleParam.getName())) {
            throw new RoleAlreadyExistedException();
        }
        Role role = Role.init(roleParam);
        return roleManager.save(role).toDto();
    }

    /**
     * 修改
     */
    @Transactional(rollbackFor = Exception.class)
    public RoleDto update(RoleParam roleParam) {
        Long id = roleParam.getId();

        // name和code唯一性校验
        if (roleManager.existsByCode(roleParam.getCode(), id)) {
            throw new RoleAlreadyExistedException();
        }
        if (roleManager.existsByName(roleParam.getName(), id)) {
            throw new RoleAlreadyExistedException();
        }

        Role role = roleManager.findById(id).orElseThrow(RoleNotExistedException::new);
        BeanUtil.copyProperties(roleParam, role, CopyOptions.create().ignoreNullValue());

        return roleManager.updateById(role).toDto();
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = { USER_PATH }, allEntries = true)
    public void delete(Long roleId) {
        if (Objects.isNull(roleId) || !roleManager.existsById(roleId)) {
            throw new RoleNotExistedException();
        }
        // 存在当前角色用户的场合不允许删除
        if (userRoleManager.existsByRoleId(roleId)) {
            throw new RoleAlreadyUsedException();
        }
        // 删除角色信息
        roleManager.deleteById(roleId);
        // 删除关联的请求和菜单权限
        rolePathManager.deleteByRole(roleId);
        roleMenuManager.deleteByRole(roleId);
    }

    /**
     * 角色列表
     */
    public List<RoleDto> findAll() {
        return ResultConvertUtil.dtoListConvert(roleManager.findAll());
    }

    /**
     * 角色分页
     */
    public PageResult<RoleDto> page(PageParam pageParam, RoleParam roleParam) {
        return MpUtil.convert2DtoPageResult(roleManager.page(pageParam, roleParam));
    }

    /**
     * 角色下拉框
     */
    public List<KeyValue> dropdown() {
        return roleManager.findDropdown();
    }

    /**
     * 详情
     */
    public RoleDto findById(Long id) {
        return ResultConvertUtil.dtoConvert(roleManager.findById(id));
    }

    /**
     * code是否存在
     */
    public boolean existsByCode(String code) {
        return roleManager.existsByCode(code);
    }

    /**
     * code是否存在
     */
    public boolean existsByCode(String code, Long id) {
        return roleManager.existsByCode(code, id);
    }

    /**
     * name是否存在
     */
    public boolean existsByName(String name) {
        return roleManager.existsByName(name);
    }

    /**
     * name是否存在
     */
    public boolean existsByName(String name, Long id) {
        return roleManager.existsByName(name, id);
    }

}
