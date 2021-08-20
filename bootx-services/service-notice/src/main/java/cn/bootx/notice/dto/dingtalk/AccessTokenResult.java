package cn.bootx.notice.dto.dingtalk;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("AccessToken响应类")
public class AccessTokenResult<T> extends DingTalkResult<T> {

    @JsonProperty("access_token")
    @ApiModelProperty("AccessToken")
    private String accessToken;

    @JsonProperty("expires_in")
    @ApiModelProperty("ExpiresIn")
    private Integer expiresIn;


}
