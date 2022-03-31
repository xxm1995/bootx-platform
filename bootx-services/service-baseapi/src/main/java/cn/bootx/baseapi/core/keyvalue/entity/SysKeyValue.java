package cn.bootx.baseapi.core.keyvalue.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* kv存储
* @author xxm
* @date 2022/3/30
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sys_key_value")
public class SysKeyValue extends MpBaseEntity {

    /**
     * key值
     */
    private String key;

    /**
     * value值
     */
    private String value;
}
