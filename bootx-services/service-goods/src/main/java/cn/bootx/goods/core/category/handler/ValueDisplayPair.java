package cn.bootx.goods.core.category.handler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**   
* 值显示对
* @author xxm  
* @date 2020/11/21 
*/
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class ValueDisplayPair {
    private String value;
    private String display;

}
