package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.entity.config.PasswordLoginFailRecord;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**   
 * 密码登录失败记录
 * @author xxm  
 * @since 2024/12/6 
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class PasswordLoginFailRecordManager extends BaseManager<PasswordLoginFailRecordMapper, PasswordLoginFailRecord> {
}
