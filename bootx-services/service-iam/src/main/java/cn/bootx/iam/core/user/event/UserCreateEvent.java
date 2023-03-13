package cn.bootx.iam.core.user.event;

import cn.bootx.iam.dto.user.UserInfoDto;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * 用户创建事件
 *
 * @author xxm
 * @date 2022/7/2
 */
@Getter
public class UserCreateEvent extends ApplicationEvent {

    private final UserInfoDto userInfo;

    public UserCreateEvent(Object source, UserInfoDto userInfo) {
        super(source);
        this.userInfo = userInfo;
    }

}
