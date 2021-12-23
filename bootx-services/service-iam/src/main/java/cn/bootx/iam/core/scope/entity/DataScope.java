package cn.bootx.iam.core.scope.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 数据范围配置
* @author xxm
* @date 2021/12/23
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_data_scope")
public class DataScope extends MpBaseEntity {

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 类型 */
    private String type;

    /** 备注 */
    private String remark;

}
