package cn.bootx.iam.core.dept.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.dept.entity.Dept;
import org.springframework.stereotype.Repository;

/**
 * @author xxm
 * @date 2020/5/7 17:42
 */
@Repository
public class DeptManager extends BaseManager<DeptMapper, Dept> {

    public boolean existsParent(Long parentId) {
        return existedByField(Dept::getParentId,parentId);
    }

    public void deleteByOrgCode(String orgCode) {
        lambdaUpdate().likeRight(Dept::getOrgCode,orgCode)
                .remove();
    }
}
