package cn.bootx.iam.core.permission.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.permission.entity.PermissionMenu;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
* 权限配置
* @author xxm
* @date 2021/8/3
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class PermissionMenuManager extends BaseManager<PermissionMenuMapper, PermissionMenu> {

    public void setLeaf(Long pid, boolean leaf) {
        lambdaUpdate().eq(PermissionMenu::getParentId,pid)
                .set(PermissionMenu::isLeaf,leaf)
                .update();
    }

    public boolean existsByParentId(Long pid) {
        return existedByField(PermissionMenu::getParentId,pid);
    }
}
