package cn.bootx.iam.core.depart.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.depart.entity.Depart;
import org.springframework.stereotype.Repository;

/**
 * @author xxm
 * @date 2020/5/7 17:42
 */
@Repository
public class DepartManager extends BaseManager<DepartMapper,Depart> {

    public boolean existsParent(Long parentId) {
        return existedByField(Depart::getParentId,parentId);
    }

    public void deleteByOrgCode(String orgCode) {
        // TODO
    }
}
