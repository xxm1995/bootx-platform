package cn.bootx.platform.baseapi.param.app;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * app版本参数
 *
 * @author xxm
 * @since 2021/8/9
 */
@Data
@Accessors(chain = true)
@Schema(title = "app版本参数")
public class AppVersionParam {

    private Long id;

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

}
