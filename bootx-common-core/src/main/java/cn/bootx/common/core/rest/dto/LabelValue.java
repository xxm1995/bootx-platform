package cn.bootx.common.core.rest.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

/**   
* LabelValue
* @author xxm  
* @date 2022/5/4 
*/
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@Schema(title = "LabelValue键值对象")
public class LabelValue {

    @Schema(description = "label")
    private String label;

    @Schema(description = "值")
    private String value;
}
