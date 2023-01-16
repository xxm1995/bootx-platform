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
    private Integer lengthCount;
    private Integer length;
    private Integer decimalLength;
    private String  type;
}
