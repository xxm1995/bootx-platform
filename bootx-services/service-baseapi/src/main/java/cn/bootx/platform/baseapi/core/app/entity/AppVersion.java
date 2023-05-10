package cn.bootx.platform.baseapi.core.app.entity;

import cn.bootx.platform.baseapi.core.app.convert.AppVersionConvert;
import cn.bootx.platform.baseapi.dto.app.AppVersionDto;
import cn.bootx.platform.baseapi.param.app.AppVersionParam;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * App版本
 *
 * @author xxm
 * @date 2021/8/9
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("App版本")
public class AppVersion extends MpBaseEntity implements EntityBaseFunction<AppVersionDto> {

    /** app版本 */
    private String appVersion;

    /** 下载地址 */
    private String url;

    /** 密码 */
    private String password;

    /** 包名 */
    private String bundleId;

    /** 说明 */
    private String description;

    public static AppVersion init(AppVersionDto in) {
        return AppVersionConvert.CONVERT.convert(in);
    }

    public static AppVersion init(AppVersionParam in) {
        return AppVersionConvert.CONVERT.convert(in);
    }

    @Override
    public AppVersionDto toDto() {
        return AppVersionConvert.CONVERT.convert(this);
    }

}
