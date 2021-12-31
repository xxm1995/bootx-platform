package cn.bootx.common.core.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**   
* 用户类
* @author xxm  
* @date 2021/7/30 
*/
@Getter
@Setter
@ToString
@Accessors(chain = true)
@NoArgsConstructor
public class UserDetail{
    private Long id;
    /** 名称 */
    private String name;
    /** 用户 */
    private String username;

    @JsonIgnore
    private transient String password;

    /** 是否管理员 */
    private boolean admin;

    /**
     * 账号状态
     * @see cn.bootx.iam.code.UserStatusCode
     */
    private Integer status;

}
