package cn.bootx.starter.dingtalk.param.notice.msg;

import cn.hutool.core.collection.CollUtil;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

;

/**
* 钉钉At
* @author xxm
* @date 2020/11/29
*/
@Data
@Accessors(chain = true)
@NoArgsConstructor
@Schema(title = "钉钉@指定用户")
public class DingAt implements Serializable {

    private static final long serialVersionUID = -8677524557109058147L;

    @Schema(description= "@的用户手机号")
    private List<String> atMobiles;

    @JsonProperty("isAtAll")
    @Schema(description= "是否@全体")
    private boolean isAtAll = false;

    public DingAt(List<String> atMobiles){
        this.atMobiles = atMobiles;
    }

    /**
     * 输出@xxx文本
     */
    public String toAt(){
        if (CollUtil.isNotEmpty(atMobiles)){
            return " @"+String.join(" @", atMobiles);
        }
        return "";
    }

}