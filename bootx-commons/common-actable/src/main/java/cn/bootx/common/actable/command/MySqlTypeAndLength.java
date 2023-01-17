package cn.bootx.common.actable.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Mysql 类型和长度
 * @author xxm
 * @date 2023/1/16
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MySqlTypeAndLength {
    /** 长度数 */
    private Integer lengthCount;
    /** 长度 */
    private Integer length;
    /** 小数长度 */
    private Integer decimalLength;
    /** 类型 */
    private String type;
}
