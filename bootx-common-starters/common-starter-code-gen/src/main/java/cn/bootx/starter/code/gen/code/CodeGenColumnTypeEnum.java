package cn.bootx.starter.code.gen.code;

import cn.bootx.common.core.exception.BizException;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.Objects;

/**
 * 数据库字段类型与java类型映射
 * @author xxm
 * @date 2022/2/17
 */
@Getter
@AllArgsConstructor
public enum CodeGenColumnTypeEnum {
    TINYINT("tinyint","Integer"),
    SMALLINT("smallint","Integer"),
    MEDIUMINT("mediumint","Integer"),
    INT("int","Integer"),
    INTEGER("integer","Integer"),
    BIGINT("bigint","Long"),
    FLOAT("float","Float"),
    DOUBLE("double","Double"),
    DECIMAL("decimal","BigDecimal"),
    BIT("bit","Boolean"),
    CHAR("char","String"),
    VARCHAR("varchar","String"),
    TINYTEXT("tinytext","String"),
    TEXT("text","String"),
    MEDIUMTEXT("mediumtext","String"),
    LONGTEXT("longtext","String"),
    DATE("date","LocalDate"),
    DATETIME("datetime","LocalDateTime"),
    TIMESTAMP("timestamp","LocalDateTime");

    private final String columnType;
    private final String javaType;

    /**
     * 数据库类型转换成java类型
     */
    public static String convertJavaType(String columnType){
        return Arrays.stream(CodeGenColumnTypeEnum.values())
                .filter(e -> Objects.equals(columnType,e.getColumnType()))
                .findFirst()
                .orElseThrow(() -> new BizException("不支持的数据库字段类型"))
                .getJavaType();
    }
}
