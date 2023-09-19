package cn.bootx.platform.iam.core.security.password.dao;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordLoginFailRecord;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * 密码登录失败记录
 * @author xxm
 * @since 2023/9/19
 */
@Slf4j
@Repository
public class PasswordLoginFailRecordManager extends BaseManager<PasswordLoginFailRecordMapper,PasswordLoginFailRecord> {


}
