package cn.bootx.notice.core.mail.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.notice.core.mail.entity.MailConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
* @author xxm
* @date 2020/4/8 13:27
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class MailConfigManager extends BaseManager<MailConfigMapper, MailConfig> {

    public Optional<MailConfig> findByActivity() {
        return findByField(MailConfig::getActivity,Boolean.TRUE);
    }

    public Optional<MailConfig> findByCode(String code) {
        return findByField(MailConfig::getCode,code);
    }

    public boolean existsByCode(String code) {
        return existedByField(MailConfig::getCode,code);
    }

    public boolean existsByActivity() {
        return existedByField(MailConfig::getActivity,Boolean.TRUE);
    }

    public void removeAllActivity() {
        lambdaUpdate().eq(MailConfig::getActivity,Boolean.TRUE).set(MailConfig::getActivity,Boolean.FALSE);
    }
}
