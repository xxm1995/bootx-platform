package cn.bootx.platform.social.core.cofig.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 三方系统
* @author xxm  
* @date 2021/10/26 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class SocialKeyConfig extends MpBaseEntity {
}
