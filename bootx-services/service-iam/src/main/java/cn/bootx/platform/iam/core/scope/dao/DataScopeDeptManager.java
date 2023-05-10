package cn.bootx.platform.iam.core.scope.dao;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.core.scope.entity.DataScopeDept;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author xxm
 * @date 2021/12/23
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class DataScopeDeptManager extends BaseManager<DataScopeDeptMapper, DataScopeDept> {

    public void deleteByDataScopeId(Long dataScopeId) {
        this.deleteByField(DataScopeDept::getDataScopeId, dataScopeId);
    }

    /**
     * 根据部门进行删除
     */
    public void deleteByDeptIds(List<Long> deptIds) {
        this.deleteByFields(DataScopeDept::getDeptId, deptIds);
    }

    public List<DataScopeDept> findByDateScopeId(Long dataScopeId) {
        return this.findAllByField(DataScopeDept::getDataScopeId, dataScopeId);
    }

}
