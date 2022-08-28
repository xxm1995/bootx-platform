package cn.bootx.common.core.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

/**   
* 用户信息类
* @author xxm  
* @date 2021/7/30 
*/
@Getter
@Setter
@ToString
@Accessors(chain = true)
@NoArgsConstructor
public class UserDetail{
    /** 用户id */
    private Long id;
    /** 用户名称 */
    private String name;
    /** 账号 */
    private String username;

    @JsonIgnore
    private transient String password;

    /** 拥有权限的应用列表 */
    private List<Long> appIds;

    /** 是否管理员 */
    private boolean admin;

    /**
     * 账号状态
     * @see cn.bootx.iam.code.UserStatusCode
     */
    private Integer status;

}
