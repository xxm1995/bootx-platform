package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.upms.entity.UserDataScope;
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
public class UserDataScopeManager extends BaseManager<UserDataScopeMapper, UserDataScope> {
    private final UserDataScopeMapper userDataScopeMapper;
    public boolean existedByDataScopeId(Long dataScopeId){
        return this.existedByField(UserDataScope::getDataScopeId,dataScopeId);
    }

    public void deleteByUser(Long userId) {
        this.deleteByField(UserDataScope::getUserId,userId);
    }

    public List<UserDataScope> findByUserId(Long userId){
        return this.findAllByField(UserDataScope::getUserId,userId);
    }
}
