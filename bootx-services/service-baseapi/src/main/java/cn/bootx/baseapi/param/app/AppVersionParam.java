package cn.bootx.baseapi.param.app;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* app版本参数
* @author xxm  
* @date 2021/8/9 
*/
@Data
@Accessors(chain = true)
@ApiModel("app版本参数")
public class AppVersionParam {

    private Long id;

    /** app版本*/
    private String appVersion;

    /**下载地址*/
    private String url;

    /**密码*/
    private String password;

    /**包名*/
    private String bundleId;

    /**说明*/
    private String description;
}
