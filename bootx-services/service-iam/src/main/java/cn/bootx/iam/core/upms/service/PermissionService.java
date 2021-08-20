package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.iam.code.permission.PermissionCode;
import cn.bootx.iam.core.upms.dao.PermissionManager;
import cn.bootx.iam.core.upms.entity.Permission;
import cn.bootx.iam.dto.upms.PermissionDto;
import cn.bootx.iam.param.upms.PermissionParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**   
* 权限
* @author xxm  
* @date 2021/8/3 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class PermissionService {
    private final PermissionManager permissionManager;

    /**
     * 添加菜单权限
     */
    @Transactional(rollbackFor = Exception.class)
    public PermissionDto add(PermissionParam param) {
        //----------------------------------------------------------------------
        //判断是否是一级菜单，是的话清空父菜单
        if(PermissionCode.MENU_TYPE_TOP.equals(param.getMenuType())) {
            param.setParentId(null);
        }
        //----------------------------------------------------------------------
        Long pid = param.getParentId();
        if(Objects.nonNull(pid)) {
            //设置父节点不为叶子节点
            permissionManager.setLeaf(pid, false);
        }
        param.setLeaf(true);
        Permission permission = Permission.init(param);
        return permissionManager.save(permission).toDto();
    }

    /**
     * 更新
     */
    @Transactional(rollbackFor = Exception.class)
    public PermissionDto update(PermissionParam param){
        Permission permission = permissionManager.findById(param.getId())
                .orElseThrow(() -> new BizException("菜单权限不存在"));
        Long oldPid = permission.getParentId();
        BeanUtil.copyProperties(param,permission, CopyOptions.create().ignoreNullValue());

        //1.判断是否是一级菜单，是的话清空父菜单ID
        if(PermissionCode.MENU_TYPE_TOP.equals(permission.getMenuType())) {
            permission.setParentId(null);
        }

        //Step2.判断菜单下级是否有菜单，无则设置为叶子节点
        if(!permissionManager.existsByParentId(permission.getId())) {
            permission.setLeaf(true);
        }
        PermissionDto permissionDto = permissionManager.updateById(permission).toDto();

        //如果当前菜单的父菜单变了，则需要修改新父菜单和老父菜单的，叶子节点状态
        Long pid = permission.getParentId();
        if (!Objects.equals(oldPid,pid)){
            //a.设置新的父菜单不为叶子节点
            if (Objects.nonNull(pid)) {
                permissionManager.setLeaf(pid, false);
            }
            //b.判断老的菜单下是否还有其他子菜单，没有的话则设置为叶子节点
            if(Objects.nonNull(oldPid) && !permissionManager.existsByParentId(oldPid)) {
                permissionManager.setLeaf(oldPid, true);
            }

        }
        return permissionDto;
    }

    /**
     * 根据id查询
     */
    public PermissionDto findById(Long id){
        return permissionManager.findById(id)
                .map(Permission::toDto)
                .orElse(null);
    }

    /**
     * 列表
     */
    public List<PermissionDto> findAll() {
        return ResultConvertUtils.dtoListConvert(permissionManager.findAll());
    }

    /**
     * 根据id集合查询
     */
    public List<PermissionDto> findByIds(List<Long> permissionIds) {
        return ResultConvertUtils.dtoListConvert(permissionManager.findAllByIds(permissionIds));
    }

    /**
     * 删除
     */
    public void delete(Long id){
        // 有子菜单不可以删除
        if (permissionManager.existsByParentId(id)){
            throw new BizException("有子权限不可以删除");
        }
        permissionManager.deleteById(id);
    }
}
