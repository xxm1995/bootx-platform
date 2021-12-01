package cn.bootx.notice.dto.dingtalk;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "AccessToken响应类")
public class AccessTokenResult<T> extends DingTalkResult<T> {

    @JsonProperty("access_token")
    @Schema(description= "AccessToken")
    private String accessToken;

    @JsonProperty("expires_in")
    @Schema(description= "ExpiresIn")
    private Integer expiresIn;


}
