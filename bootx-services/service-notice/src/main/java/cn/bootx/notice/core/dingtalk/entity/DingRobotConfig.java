package cn.bootx.notice.core.dingtalk.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.notice.core.dingtalk.convert.DingTalkConvert;
import cn.bootx.notice.dto.dingtalk.DingRobotConfigDto;
import cn.bootx.notice.param.dingtalk.DingRobotConfigParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 钉钉机器人配置
* @author xxm  
* @date 2020/11/29 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("nc_ding_robot_config")
public class DingRobotConfig extends MpBaseEntity implements EntityBaseFunction<DingRobotConfigDto> {

    /**  机器人编号编号 */
    private String code;

    /** 机器人配置名称 */
    private String name;

    /** 钉钉机器人的accessToken */
    private String accessToken;

	/** 是否开启验签 */
	private boolean enableSignatureCheck;

	/** 验签秘钥 */
	private String signSecret;

    public static DingRobotConfig init(DingRobotConfigDto in){
        return DingTalkConvert.CONVERT.convert(in);
    }

    public static DingRobotConfig init(DingRobotConfigParam in){
        return DingTalkConvert.CONVERT.convert(in);
    }

    @Override
    public DingRobotConfigDto toDto() {
        return DingTalkConvert.CONVERT.convert(this);
    }
}
