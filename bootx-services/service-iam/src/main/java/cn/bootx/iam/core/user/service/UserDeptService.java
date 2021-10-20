package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.iam.core.dept.dao.DeptManager;
import cn.bootx.iam.core.user.dao.UserDeptManager;
import cn.bootx.iam.core.user.entity.UserDept;
import cn.bootx.iam.dto.dept.DeptDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
* 用户部门关联关系
* @author xxm
* @date 2021/9/29
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserDeptService {
    private final UserDeptManager userDeptManager;
    private final DeptManager deptManager;

    /**
     * 给用户分配部门
     */
    @Transactional(rollbackFor = Exception.class)
    public void saveAndUpdate(Long userId, List<Long> deptIds){

        // 先删除用户拥有的部门
        userDeptManager.deleteByUser(userId);
        // 然后给用户添加部门
        List<UserDept> userDeptList = deptIds.stream()
                .map(roleId -> new UserDept().setDeptId(roleId).setUserId(userId))
                .collect(Collectors.toList());
        userDeptManager.saveAll(userDeptList);
    }

    /**
     * 根据用户Id查询部门id
     */
    public List<Long> findDeptIdsByUser(Long userId) {
        return userDeptManager.findDeptIdsByUser(userId).stream()
                .map(UserDept::getDeptId)
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * 查询用户所对应的部门
     */
    public List<DeptDto> findDeptListByUser(Long userId){
        return ResultConvertUtils.dtoListConvert(deptManager.findAllByIds(this.findDeptIdsByUser(userId)));
    }

}
