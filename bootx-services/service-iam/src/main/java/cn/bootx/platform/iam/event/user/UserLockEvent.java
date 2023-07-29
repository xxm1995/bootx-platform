package cn.bootx.platform.iam.event.user;

import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * 锁定用户
 * @author xxm
 * @since 2023/7/29
 */
@Getter
public class UserLockEvent extends ApplicationEvent {

    private final List<Long> userIds;

    public UserLockEvent(Object source, Long ...userIds) {
        super(source);
        if (Objects.nonNull(userIds)){
            this.userIds = Arrays.asList(userIds);
        } else {
            this.userIds = null;
        }
    }
}
