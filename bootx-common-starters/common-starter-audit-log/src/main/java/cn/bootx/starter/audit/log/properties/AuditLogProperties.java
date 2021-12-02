package cn.bootx.starter.audit.log.properties;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**   
* 审计日志配置
* @author xxm  
* @date 2021/12/2 
*/
@Getter
@Setter
@ConfigurationProperties(prefix = "bootx.starter.audit-log")
public class AuditLogProperties {

    /**
     * 存储方式, 支持jdbc和mongo
     */
    private String store = "jdbc";
}
