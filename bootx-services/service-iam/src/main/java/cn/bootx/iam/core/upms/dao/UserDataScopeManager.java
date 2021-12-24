package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.upms.entity.UserDataScope;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
*
* @author xxm  
* @date 2021/12/23 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class UserDataScopeManager extends BaseManager<UserDataScopeMapper, UserDataScope> {

    public boolean existedByDataScopeIdd(Long dataScopeId){
        return this.existedByField(UserDataScope::getDeptId,dataScopeId);
    }
}
