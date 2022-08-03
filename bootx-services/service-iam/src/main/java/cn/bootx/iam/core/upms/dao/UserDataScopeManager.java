package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.upms.entity.UserDataScope;
import cn.bootx.starter.auth.util.SecurityUtil;
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
    public boolean existsByDataScopeId(Long dataScopeId){
        return this.existedByField(UserDataScope::getDataScopeId,dataScopeId);
    }

    public void deleteByUser(Long userId) {
        this.deleteByField(UserDataScope::getUserId,userId);
    }

    public void deleteByUsers(List<Long> userIds) {
        this.deleteByFields(UserDataScope::getUserId,userIds);
    }

    public List<UserDataScope> findByUserId(Long userId){
        return this.findAllByField(UserDataScope::getUserId,userId);
    }

    @Override
    public List<UserDataScope> saveAll(List<UserDataScope> dataScopes){
        MpUtil.initEntityList(dataScopes, SecurityUtil.getUserIdOrDefaultId());
        MpUtil.executeBatch(dataScopes,baseMapper::saveAll,this.DEFAULT_BATCH_SIZE);
        return dataScopes;
    }
}
