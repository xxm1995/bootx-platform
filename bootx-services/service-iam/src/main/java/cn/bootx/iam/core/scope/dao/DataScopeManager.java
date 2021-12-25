package cn.bootx.iam.core.scope.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.scope.entity.DataScope;
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
public class DataScopeManager extends BaseManager<DataScopeMapper, DataScope> {


    public boolean existsByCode(String code){
        return this.existedByField(DataScope::getCode,code);
    }

    public boolean existsByCode(String code,Long id){
        return this.existedByField(DataScope::getCode,code,id);
    }

    public boolean existsByName(String name) {
        return this.existedByField(DataScope::getName,name);
    }

    public boolean existsByName(String name, Long id) {
        return this.existedByField(DataScope::getName,name,id);
    }
}
