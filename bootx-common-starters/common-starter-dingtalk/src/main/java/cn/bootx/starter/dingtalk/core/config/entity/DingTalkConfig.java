package cn.bootx.starter.dingtalk.core.config.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.starter.dingtalk.core.config.convert.DingConfigConvert;
import cn.bootx.starter.dingtalk.dto.config.DingTalkConfigDto;
import cn.bootx.starter.dingtalk.param.config.DingTalkConfigParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 钉钉配置
* @author xxm  
* @date 2022/4/2 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("ding_config")
public class DingTalkConfig extends MpBaseEntity implements EntityBaseFunction<DingTalkConfigDto> {

    /** 名称 */
    private String name;

    /** AppKey */
    private String appKey;

    /** AppSecret */
    private String appSecret;

    /** 是否启用 */
    private Boolean enable;

    /** 备注 */
    private String remark;


    public static DingTalkConfig init(DingTalkConfigParam in){
        return DingConfigConvert.CONVERT.convert(in);
    }

    @Override
    public DingTalkConfigDto toDto() {
        return DingConfigConvert.CONVERT.convert(this);
    }
}
