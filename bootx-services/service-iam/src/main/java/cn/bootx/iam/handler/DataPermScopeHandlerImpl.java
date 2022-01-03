package cn.bootx.iam.handler;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.iam.core.upms.service.UserDataScopeService;
import cn.bootx.starter.auth.exception.NotLoginException;
import cn.bootx.starter.data.perm.local.DataPermContextHolder;
import cn.bootx.starter.data.perm.scope.DataPermScope;
import cn.bootx.starter.data.perm.scope.DataPermScopeHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
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
     * 需要进行懒加载方式的注入, 因为 DataPermScopeHandler bean创建时机比UserDataScopeService早
     */
    @SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
    @Lazy
    @Autowired
    private UserDataScopeService userDataScopeService;

    /**
     * 获取数据权限范围配置
     */
    @Override
    public DataPermScope getDataPermScope() {
        Long userId = DataPermContextHolder.getUserDetail().map(UserDetail::getId).orElseThrow(NotLoginException::new);
        return userDataScopeService.getDataPermScopeByUser(userId);
    }
}
