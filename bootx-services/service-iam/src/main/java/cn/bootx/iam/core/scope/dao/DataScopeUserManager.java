package cn.bootx.iam.core.scope.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.scope.entity.DataScopeUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**   
* 
* @author xxm  
* @date 2021/12/23 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class DataScopeUserManager extends BaseManager<DataScopeUserMapper, DataScopeUser> {

    public boolean existedByDataScopeId(Long dataScopeId){
        return this.existedByField(DataScopeUser::getDataScopeId,dataScopeId);
    }

    public boolean existedByDataScopeIdAndUserId(Long dataScopeId,Long userId){
        return this.lambdaQuery().eq(DataScopeUser::getDataScopeId,dataScopeId)
                .eq(DataScopeUser::getUserId,userId)
                .exists();
    }

    public void deleteByDataScopeId(Long dataScopeId){
        this.deleteByField(DataScopeUser::getDataScopeId,dataScopeId);
    }

    public List<DataScopeUser> findByDateScopeId(Long dataScopeId){
        return this.findAllByField(DataScopeUser::getDataScopeId,dataScopeId);
    }
}
