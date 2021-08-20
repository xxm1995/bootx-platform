package cn.bootx.sales.dto.check;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* 检查结果
* @author xxm
* @date 2021/5/20
*/
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class CheckRuleResult implements Serializable {
    private static final long serialVersionUID = 7350355891944002874L;

    /** 通过状态 */
    private boolean pass = true;

    /** 错误提示 */
    private String msg;
}
