package cn.bootx.iam.handler;

import cn.bootx.starter.data.perm.code.DataScopeType;
import cn.bootx.starter.data.perm.scope.DataPermScope;
import cn.bootx.starter.data.perm.scope.DataPermScopeHandler;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 数据权限业务实现
* @author xxm  
* @date 2021/12/22 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DataPermScopeHandlerImpl implements DataPermScopeHandler {

    /**
     * 获取数据权限范围配置
     */
    @Override
    public DataPermScope getDataPermScope() {
        return new DataPermScope()
                .setScopeType(DataScopeType.DEPT_AND_USER_SCOPE)
                .setDeptScopeIds(CollUtil.newHashSet(1259383094134804482L));
    }
}
