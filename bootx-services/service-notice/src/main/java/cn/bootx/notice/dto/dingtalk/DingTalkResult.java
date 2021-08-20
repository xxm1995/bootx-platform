package cn.bootx.notice.dto.dingtalk;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* 钉钉响应结果
* @author xxm  
* @date 2020/11/30 
*/
@Data
@Accessors(chain = true)
@ApiModel("钉钉发送响应类")
public class DingTalkResult<T> implements Serializable {
    private static final long serialVersionUID = 4298060961428118100L;

    @JsonProperty("errcode")
    @ApiModelProperty("错误码")
    private Integer code;

    @ApiModelProperty("返回数据")
    private T result;

    @JsonProperty("errmsg")
    @ApiModelProperty("内容")
    private String msg;

}
