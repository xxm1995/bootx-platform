package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.upms.entity.RoleMenu;
import cn.hutool.core.util.IdUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 角色权限关系
 * @author xxm
 * @date 2021/8/3
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class RoleMenuManager extends BaseManager<RoleMenuMapper, RoleMenu> {

    public void deleteByPermission(Long permissionId) {
        deleteByField(RoleMenu::getPermissionId,permissionId);
    }

    public void deleteByRole(Long roleId){
        this.deleteByField(RoleMenu::getRoleId,roleId);
    }

    public List<RoleMenu> findAllByRoles(List<Long> roleIds) {
        return findAllByFields(RoleMenu::getRoleId,roleIds);
    }

    public List<RoleMenu> findAllByRoleAndAppCode(Long roleId, String appCode) {
        return lambdaQuery()
                .eq(RoleMenu::getRoleId,roleId)
                .eq(RoleMenu::getAppCode,appCode)
                .list();

    }

    @Override
    public List<RoleMenu> saveAll(List<RoleMenu> list) {
        list.forEach(roleMenu -> roleMenu.setId(IdUtil.getSnowflakeNextId()));
        MpUtil.executeBatch(list,baseMapper::saveAll,this.DEFAULT_BATCH_SIZE);
        return list;
    }
}
