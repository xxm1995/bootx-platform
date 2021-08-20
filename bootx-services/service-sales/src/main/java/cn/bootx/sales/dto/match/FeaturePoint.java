package cn.bootx.sales.dto.match;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/5/18
*/
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ApiModel("特征点")
public class FeaturePoint {

    /** 特征点类型 */
    private String type;

    /** 特征点值 */
    private String point;
}
