package cn.bootx.platform.iam.event.user;

import cn.bootx.platform.iam.result.user.UserInfoResult;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * 用户创建事件
 *
 * @author xxm
 * @since 2022/7/2
 */
@Getter
public class UserCreateEvent extends ApplicationEvent {
    private final UserInfoResult userInfo;

    public UserCreateEvent(Object source, UserInfoResult userInfo) {
        super(source);
        this.userInfo = userInfo;
    }

}
