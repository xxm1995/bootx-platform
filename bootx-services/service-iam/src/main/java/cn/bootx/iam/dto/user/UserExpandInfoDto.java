package cn.bootx.iam.dto.user;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**   
*
* @author xxm  
* @date 2022/1/8 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "用户扩展信息")
public class UserExpandInfoDto extends BaseDto {

    @Schema(description = "性别")
    private Integer sex;

    @Schema(description= "头像")
    private String avatar;

    @Schema(description = "生日")
    private LocalDate birthday;

    @Schema(description = "上次登录时间")
    private LocalDateTime lastLoginTime;

    @Schema(description = "本次登录时间")
    private LocalDateTime currentLoginTime;

    @Schema(description = "是否初始密码")
    private boolean initialPassword;

    @Schema(description = "上次修改密码时间")
    private LocalDateTime lastChangePasswordTime;

}
