package cn.bootx.common.core.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**   
* 用户
* @author xxm  
* @date 2021/7/30 
*/
@Getter
@Setter
@NoArgsConstructor
public class UserDetail{
    private Long id;
    private String name;
    private transient String username;
    private String password;

    public UserDetail(Long id, String name, String username) {
        this.id = id;
        this.name = name;
        this.username = username;
    }

    public UserDetail(Long id, String name,String username, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.username = username;
    }

}
