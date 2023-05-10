package cn.bootx.platform.demo.core.sensitive.entity;

import cn.bootx.platform.starter.data.perm.sensitive.SensitiveInfo;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 数据脱敏
 *
 * @author xxm
 * @date 2022/3/24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "数据脱敏")
@TableName("demo_data_sensitive")
public class DataSensitiveDemo extends MpBaseEntity {

    @Schema(description = "中文名字")
    @SensitiveInfo(SensitiveInfo.SensitiveType.CHINESE_NAME)
    private String chineseName;

    @Schema(description = "密码")
    @SensitiveInfo(SensitiveInfo.SensitiveType.PASSWORD)
    private String password;

    @Schema(description = "身份证号")
    @SensitiveInfo(SensitiveInfo.SensitiveType.ID_CARD)
    private String idCard;

    @Schema(description = "手机号")
    @SensitiveInfo(SensitiveInfo.SensitiveType.MOBILE_PHONE)
    private String mobilePhone;

    @Schema(description = "车牌号")
    @SensitiveInfo(SensitiveInfo.SensitiveType.CAR_LICENSE)
    private String carLicense;

    @Schema(description = "电子邮件")
    @SensitiveInfo(SensitiveInfo.SensitiveType.EMAIL)
    private String email;

    @Schema(description = "其他")
    @SensitiveInfo(SensitiveInfo.SensitiveType.OTHER)
    private String other;

}
