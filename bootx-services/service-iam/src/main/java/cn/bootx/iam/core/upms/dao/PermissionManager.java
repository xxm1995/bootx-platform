package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.upms.entity.Permission;
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
public class PermissionManager extends BaseManager<PermissionMapper,Permission> {

    public void setLeaf(Long pid, boolean leaf) {
        lambdaUpdate().eq(Permission::getParentId,pid)
                .set(Permission::isLeaf,leaf)
                .update();
    }

    public boolean existsByParentId(Long pid) {
        return existedByField(Permission::getParentId,pid);
    }
}
