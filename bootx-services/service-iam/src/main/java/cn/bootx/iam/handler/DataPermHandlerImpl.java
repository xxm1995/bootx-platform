package cn.bootx.iam.handler;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.data.perm.data.DataPermHandler;
import cn.bootx.starter.data.perm.local.DataPermContextHolder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**   
* 数据权限业务实现
* @author xxm  
* @date 2021/12/22 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DataPermHandlerImpl implements DataPermHandler {

    /**
     * 想想怎么进行组织语言
     */
    @Override
    public List<Long> whereIds() {
        Optional<UserDetail> currentUser = DataPermContextHolder.getUserDetail();
        if (currentUser.isPresent()){
            List<Long> ids = new ArrayList<>();
            ids.add(1259383094134804482L);
            return ids;
        }
        return new ArrayList<>(1);
    }
}
