package cn.bootx.iam.core.client.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.client.convert.ClientConvert;
import cn.bootx.iam.dto.client.ClientDto;
import cn.bootx.iam.param.client.ClientParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 认证终端
* @author xxm
* @date 2021/8/25
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_client")
@Accessors(chain = true)
public class Client extends MpBaseEntity implements EntityBaseFunction<ClientDto> {

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 在线时长 分钟 */
    private Long timeout;

    /** 是否有独立菜单和权限 独立应用/登录方式 */
    private boolean alonePrem;

    /** 是否需要验证码 */
    private boolean captcha;

    /** 是否系统内置 */
    @TableField("`system`")
    private boolean system;

    /** 密码错误几次冻结 -1表示不限制 */
    private Integer pwdErrNum;

    /** 是否可用 */
    private boolean enable;

    /** 描述 */
    private String description;

    public static Client init(ClientParam in){
        return ClientConvert.CONVERT.convert(in);
    }

    @Override
    public ClientDto toDto() {
        return ClientConvert.CONVERT.convert(this);
    }
}
