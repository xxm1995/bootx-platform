package cn.bootx.iam.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* @author xxm
* @date 2021/6/2 
*/
@Data
@Accessors(chain = true)
@Schema(title = "用户信息参数")
public class UserInfoParam implements Serializable {
    private static final long serialVersionUID = -1263052439212534900L;

    @Schema(name = "主键")
    private Long id;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "登录账号")
    private String username;

    @Schema(name = "手机号")
    private String phone;

    @Schema(name = "邮箱")
    private String email;

    @Schema(name = "头像")
    private String avatar;

    @Schema(name = "密码")
    private String password;

}
