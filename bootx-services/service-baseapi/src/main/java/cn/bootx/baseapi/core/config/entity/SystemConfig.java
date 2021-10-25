package cn.bootx.baseapi.core.config.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 系统配置
* @author xxm
* @date 2021/10/25
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class SystemConfig extends MpBaseEntity {
}
