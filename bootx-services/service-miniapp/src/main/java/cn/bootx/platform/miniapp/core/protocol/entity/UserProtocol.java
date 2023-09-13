package cn.bootx.platform.miniapp.core.protocol.entity;

import cn.bootx.table.modify.annotation.DbColumn;
import cn.bootx.table.modify.mybatis.mysq.annotation.DbMySqlFieldType;
import cn.bootx.table.modify.mybatis.mysq.constants.MySqlFieldTypeEnum;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.miniapp.core.protocol.convert.UserProtocolConvert;
import cn.bootx.platform.miniapp.dto.protocol.UserProtocolDto;
import cn.bootx.platform.miniapp.param.protocol.UserProtocolParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 用户协议
* @author xxm
* @since 2023-08-02
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("miniapp_user_protocol")
public class UserProtocol extends MpBaseEntity implements EntityBaseFunction<UserProtocolDto>{

    /** 编码 */
    @DbColumn(comment = "编码")
    private String code;
    /** 内容 */
    @DbColumn(comment = "内容")
    @DbMySqlFieldType(MySqlFieldTypeEnum.LONGTEXT)
    private String content;
    /** 备注 */
    @DbColumn(comment = "备注")
    private String remark;

    /** 创建对象 */
    public static UserProtocol init(UserProtocolParam in) {
            return UserProtocolConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public UserProtocolDto toDto() {
        return UserProtocolConvert.CONVERT.convert(this);
    }
}
