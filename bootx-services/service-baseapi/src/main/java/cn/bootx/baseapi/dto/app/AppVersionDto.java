package cn.bootx.baseapi.dto.app;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author xxm
 * @date 2021/8/9
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "app版本")
public class AppVersionDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = -7287549085443499458L;

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
