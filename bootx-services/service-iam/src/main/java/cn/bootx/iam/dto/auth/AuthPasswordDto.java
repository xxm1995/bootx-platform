package cn.bootx.iam.dto.auth;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**   
* @author xxm
* @date 2020/4/25 17:27 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "密码认证信息")
public class AuthPasswordDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = -131891945146840339L;

    @Schema(description= "用户主键", required = true)
    private Long uid;

    @Schema(description= "用户密码", required = true)
    private String password;

    @Schema(description= "最后登录时间", readOnly = true)
    private LocalDateTime lastLoginTime;
}
