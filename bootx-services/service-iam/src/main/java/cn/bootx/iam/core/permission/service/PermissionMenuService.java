package cn.bootx.iam.core.permission.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.iam.code.PermissionCode;
import cn.bootx.iam.core.permission.dao.PermissionMenuManager;
import cn.bootx.iam.core.permission.entity.PermissionMenu;
import cn.bootx.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.param.permission.PermissionMenuParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**   
* 权限
* @author xxm  
* @date 2021/8/3 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class PermissionMenuService {
    private final PermissionMenuManager permissionMenuManager;
    private final RoleMenuManager roleMenuManager;

    /**
     * 添加菜单权限
     */
    @Transactional(rollbackFor = Exception.class)
    public PermissionMenuDto add(PermissionMenuParam param) {
        //判断是否是一级菜单，是的话清空父菜单
        if(PermissionCode.MENU_TYPE_TOP.equals(param.getMenuType())) {
            param.setParentId(null);
        }
        PermissionMenu permission = PermissionMenu.init(param);
        return permissionMenuManager.save(permission).toDto();
    }

    /**
     * 更新
     */
    @Transactional(rollbackFor = Exception.class)
    public PermissionMenuDto update(PermissionMenuParam param){
        PermissionMenu permission = permissionMenuManager.findById(param.getId())
                .orElseThrow(() -> new BizException("菜单权限不存在"));
        BeanUtil.copyProperties(param,permission, CopyOptions.create().ignoreNullValue());

        // 判断是否是一级菜单，是的话清空父菜单ID
        if(PermissionCode.MENU_TYPE_TOP.equals(permission.getMenuType())) {
            permission.setParentId(null);
        }
        return permissionMenuManager.updateById(permission).toDto();
    }

    /**
     * 根据id查询
     */
    public PermissionMenuDto findById(Long id){
        return permissionMenuManager.findById(id)
                .map(PermissionMenu::toDto)
                .orElse(null);
    }

    /**
     * 列表
     */
    public List<PermissionMenuDto> findAll() {
        return ResultConvertUtil.dtoListConvert(permissionMenuManager.findAll());
    }

    /**
     * 根据id集合查询
     */
    @ConditionalOnProperty
    public List<PermissionMenuDto> findByIds(List<Long> permissionIds) {
        return ResultConvertUtil.dtoListConvert(permissionMenuManager.findAllByIds(permissionIds));
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        // 有子菜单不可以删除
        if (permissionMenuManager.existsByParentId(id)){
            throw new BizException("有子菜单或下属权限不可以删除");
        }
        roleMenuManager.deleteByPermission(id);
        permissionMenuManager.deleteById(id);
    }

}
