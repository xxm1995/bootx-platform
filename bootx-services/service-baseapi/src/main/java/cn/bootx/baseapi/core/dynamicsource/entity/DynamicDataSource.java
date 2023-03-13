package cn.bootx.baseapi.core.dynamicsource.entity;

import cn.bootx.baseapi.core.dynamicsource.convert.DynamicDataSourceConvert;
import cn.bootx.baseapi.dto.dynamicsource.DynamicDataSourceDto;
import cn.bootx.baseapi.param.dynamicsource.DynamicDataSourceParam;
import cn.bootx.common.core.annotation.EncryptionField;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 动态数据源管理
 *
 * @author xxm
 * @date 2022-09-24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("base_dynamic_data_source")
public class DynamicDataSource extends MpBaseEntity implements EntityBaseFunction<DynamicDataSourceDto> {

    /** 数据源编码 */
    private String code;

    /** 数据源名称 */
    private String name;

    /** 数据库类型 */
    private String databaseType;

    /** 驱动类 */
    private String dbDriver;

    /** 数据库地址 */
    private String dbUrl;

    /** 用户名 */
    private String dbUsername;

    /** 密码 */
    @EncryptionField
    private String dbPassword;

    /** 备注 */
    private String remark;

    /** 创建对象 */
    public static DynamicDataSource init(DynamicDataSourceParam in) {
        return DynamicDataSourceConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public DynamicDataSourceDto toDto() {
        return DynamicDataSourceConvert.CONVERT.convert(this);
    }

}
