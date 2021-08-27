package cn.bootx.starter.auth.entity;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/8/25
*/
@Data
@Accessors(chain = true)
@ApiModel("认证终端")
public class AuthClient {
    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 在线时长 分钟 */
    private long timeout;

    /** 是否可用 */
    private boolean enable;
}
