package cn.bootx.platform.iam.core.scope.entity;

import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.iam.core.scope.convert.DataScopeConvert;
import cn.bootx.platform.iam.param.scope.DataScopeParam;
import cn.bootx.platform.starter.data.perm.code.DataScopeEnum;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.iam.dto.scope.DataScopeDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 数据范围配置
 *
 * @author xxm
 * @date 2021/12/23
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_data_scope")
public class DataScope extends MpBaseEntity implements EntityBaseFunction<DataScopeDto> {

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /**
     * 类型
     * @see DataScopeEnum
     */
    private Integer type;

    /** 备注 */
    private String remark;

    public static DataScope init(DataScopeParam in) {
        return DataScopeConvert.CONVERT.convert(in);
    }

    @Override
    public DataScopeDto toDto() {
        return DataScopeConvert.CONVERT.convert(this);
    }

}
