package cn.bootx.iam.core.permission.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.iam.code.PermissionCode;
import cn.bootx.iam.core.permission.dao.PermMenuManager;
import cn.bootx.iam.core.permission.entity.PermMenu;
import cn.bootx.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.iam.dto.permission.PermMenuDto;
import cn.bootx.iam.param.permission.PermMenuParam;
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
public class PermMenuService {
    private final PermMenuManager permMenuManager;
    private final RoleMenuManager roleMenuManager;

    /**
     * 添加菜单权限
     */
    @Transactional(rollbackFor = Exception.class)
    public PermMenuDto add(PermMenuParam param) {
        //判断是否是一级菜单，是的话清空父菜单
        if(PermissionCode.MENU_TYPE_TOP.equals(param.getMenuType())) {
            param.setParentId(null);
        }
        PermMenu permission = PermMenu.init(param);
        return permMenuManager.save(permission).toDto();
    }

    /**
     * 更新
     */
    @Transactional(rollbackFor = Exception.class)
    public PermMenuDto update(PermMenuParam param){
        PermMenu permission = permMenuManager.findById(param.getId())
                .orElseThrow(() -> new BizException("菜单权限不存在"));
        BeanUtil.copyProperties(param,permission, CopyOptions.create().ignoreNullValue());

        // 判断是否是一级菜单，是的话清空父菜单ID
        if(PermissionCode.MENU_TYPE_TOP.equals(permission.getMenuType())) {
            permission.setParentId(null);
        }
        return permMenuManager.updateById(permission).toDto();
    }

    /**
     * 根据id查询
     */
    public PermMenuDto findById(Long id){
        return permMenuManager.findById(id)
                .map(PermMenu::toDto)
                .orElse(null);
    }

    /**
     * 列表
     */
    public List<PermMenuDto> findAll() {
        return ResultConvertUtil.dtoListConvert(permMenuManager.findAll());
    }

    /**
     * 根据id集合查询
     */
    @ConditionalOnProperty
    public List<PermMenuDto> findByIds(List<Long> permissionIds) {
        return ResultConvertUtil.dtoListConvert(permMenuManager.findAllByIds(permissionIds));
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        // 有子菜单不可以删除
        if (permMenuManager.existsByParentId(id)){
            throw new BizException("有子菜单或下属权限不可以删除");
        }
        roleMenuManager.deleteByPermission(id);
        permMenuManager.deleteById(id);
    }

}
