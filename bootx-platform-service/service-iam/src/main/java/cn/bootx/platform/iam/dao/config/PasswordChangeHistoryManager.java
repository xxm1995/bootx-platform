package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.entity.security.PasswordChangeHistory;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 密码修改记录
 * @author xxm
 * @since 2024/12/6
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class PasswordChangeHistoryManager extends BaseManager<PasswordChangeHistoryMapper, PasswordChangeHistory> {
    /**
     * 查询指定用户最近N条历史
     */
    public List<PasswordChangeHistory> findAllByUserAndCount(Long userId, int count){
        Page<PasswordChangeHistory> page = new Page<>(1,count);
        page.setSearchCount(false);
        return lambdaQuery()
                .eq(PasswordChangeHistory::getUserId,userId)
                .orderByDesc(PasswordChangeHistory::getId)
                .page(page)
                .getRecords();
    }
}
