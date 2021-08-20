package cn.bootx.common.core.rest.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**   
* 基础Dto
* @author xxm  
* @date 2020/6/1 16:12 
*/
@Getter
@Setter
@Accessors(chain = true)
public class BaseDto implements Serializable {
    private static final long serialVersionUID = 2985535678913619503L;
    @ApiModelProperty("主键")
    private Long id;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("最后修改时间")
    private LocalDateTime lastModifiedTime;

    @ApiModelProperty("版本号")
    private Integer version;

}
