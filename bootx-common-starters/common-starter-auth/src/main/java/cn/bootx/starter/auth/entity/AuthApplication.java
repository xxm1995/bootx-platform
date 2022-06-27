package cn.bootx.starter.auth.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
* 认证应用
* @author xxm  
* @date 2022/6/27 
*/
@Data
@Accessors(chain = true)
public class AuthApplication {

    /** 终端id */
    private Long id;

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 是否可用 */
    private boolean enable;

    /** 关联应用方式 */
    private List<Long> clientIds;
}
