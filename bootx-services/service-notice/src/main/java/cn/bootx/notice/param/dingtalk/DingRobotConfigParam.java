package cn.bootx.notice.param.dingtalk;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* @author xxm
* @date 2021/8/5 
*/
@Data
@Accessors(chain = true)
@ApiModel("钉钉机器人配置参数")
public class DingRobotConfigParam implements Serializable {

    private static final long serialVersionUID = -3979174622716815670L;
    /** 主键 */
    private Long id;
    
    /** 编号 */
    private String code;

    /** 配置名称 */
    private String name;

    /** 钉钉机器人的accessToken */
    private String accessToken;

    /** 是否开启验签 */
    private boolean enableSignatureCheck;

    /** 验签秘钥 */
    private String signSecret;
}
