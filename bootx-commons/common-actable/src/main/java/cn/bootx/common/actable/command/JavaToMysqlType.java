package cn.bootx.common.actable.command;

import cn.bootx.common.core.code.actable.MySqlFieldType;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xxm
 * @date 2023/1/16
 */
public class JavaToMysqlType {

    public static Map<String, MySqlFieldType> javaToMysqlTypeMap = new HashMap<String, MySqlFieldType>();
    static {
        javaToMysqlTypeMap.put("class java.lang.String", MySqlFieldType.VARCHAR);
        javaToMysqlTypeMap.put("class java.lang.Long", MySqlFieldType.BIGINT);
        javaToMysqlTypeMap.put("class java.lang.Integer", MySqlFieldType.INT);
        javaToMysqlTypeMap.put("class java.lang.Boolean", MySqlFieldType.BIT);
        javaToMysqlTypeMap.put("class java.math.BigInteger", MySqlFieldType.BIGINT);
        javaToMysqlTypeMap.put("class java.lang.Float", MySqlFieldType.FLOAT);
        javaToMysqlTypeMap.put("class java.lang.Double", MySqlFieldType.DOUBLE);
        javaToMysqlTypeMap.put("class java.lang.Short", MySqlFieldType.SMALLINT);
        javaToMysqlTypeMap.put("class java.math.BigDecimal", MySqlFieldType.DECIMAL);
        javaToMysqlTypeMap.put("class java.sql.Date", MySqlFieldType.DATETIME);
        javaToMysqlTypeMap.put("class java.util.Date", MySqlFieldType.DATETIME);
        javaToMysqlTypeMap.put("class java.sql.Timestamp", MySqlFieldType.DATETIME);
        javaToMysqlTypeMap.put("class java.sql.Time", MySqlFieldType.TIME);
        javaToMysqlTypeMap.put("class java.time.LocalDateTime", MySqlFieldType.DATETIME);
        javaToMysqlTypeMap.put("class java.time.LocalDate", MySqlFieldType.DATE);
        javaToMysqlTypeMap.put("class java.time.LocalTime", MySqlFieldType.TIME);
        javaToMysqlTypeMap.put("long", MySqlFieldType.BIGINT);
        javaToMysqlTypeMap.put("int", MySqlFieldType.INT);
        javaToMysqlTypeMap.put("boolean", MySqlFieldType.BIT);
        javaToMysqlTypeMap.put("float", MySqlFieldType.FLOAT);
        javaToMysqlTypeMap.put("double", MySqlFieldType.DOUBLE);
        javaToMysqlTypeMap.put("short", MySqlFieldType.SMALLINT);
        javaToMysqlTypeMap.put("char", MySqlFieldType.VARCHAR);
    }

}
