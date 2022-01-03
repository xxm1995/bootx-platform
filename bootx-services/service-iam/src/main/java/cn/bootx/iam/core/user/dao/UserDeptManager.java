package cn.bootx.iam.core.user.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.user.entity.UserDept;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户部门关系
 * @author xxm
 * @date 2021/9/29
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class UserDeptManager extends BaseManager<UserDeptMapper, UserDept> {
    /**
     * 根据用户id删除关联关系
     */
    public void deleteByUser(Long userId) {
        this.deleteByField(UserDept::getUserId,userId);
    }

    /**
     * 根据部门id集合删除
     */
    public void deleteByDeptIds(List<Long> deptIds) {
        this.deleteByFields(UserDept::getDeptId,deptIds);
    }

    /**
     * 根据用户id 查询部门ids
     */
    public List<UserDept> findDeptIdsByUser(Long userId) {
        return findAllByField(UserDept::getUserId,userId);
    }
}
