package cn.bootx.common.actable.utils;

import cn.bootx.common.actable.annotation.impl.ColumnImpl;
import cn.bootx.common.actable.command.JavaToMysqlType;
import cn.bootx.common.actable.command.MySqlTypeAndLength;
import cn.bootx.common.core.annotation.actable.*;
import cn.bootx.common.core.code.actable.MySqlCharset;
import cn.bootx.common.core.code.actable.MySqlEngine;
import cn.bootx.common.core.code.actable.MySqlFieldType;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.google.common.base.CaseFormat;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.BeanUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.*;

/**
 * 行工具类
 *
 * @author xxm
 * @date 2023/1/16
 */
public class ColumnUtils {

    /** 默认值 */
    public static final String DEFAULT_VALUE = "DEFAULT";

    /** SQL 转义字符 */
    public static final String SQL_ESCAPE_CHARACTER = "`";

    /**
     * 获取Mysql的类型，以及类型需要设置几个长度，这里构建成map的样式
     * 构建Map(字段名(小写),需要设置几个长度(0表示不需要设置，1表示需要设置一个，2表示需要设置两个))
     */
    public static final Map<String, MySqlTypeAndLength> mySqlTypeAndLengthMap;

    /**
     * 获取表名称
     */
    public static String getTableName(Class<?> clazz) {
        Table table = clazz.getAnnotation(Table.class);
        TableName tableNamePlus = clazz.getAnnotation(TableName.class);
        EnableTimeSuffix enableTimeSuffix = clazz.getAnnotation(EnableTimeSuffix.class);
        if (!hasTableAnnotation(clazz)) {
            return null;
        }
        String finalTableName = "";
        if (table != null && StrUtil.isNotBlank(table.name())) {
            finalTableName = table.name();
        }
        if (table != null && StrUtil.isNotBlank(table.value())) {
            finalTableName = table.value();
        }
        if (tableNamePlus != null && StrUtil.isNotBlank(tableNamePlus.value())) {
            finalTableName = tableNamePlus.value();
        }
        if (StrUtil.isBlank(finalTableName)) {
            // 都为空时采用类名按照驼峰格式转会为表名
            finalTableName = getBuildLowerName(clazz.getSimpleName());
        }
        if (null != enableTimeSuffix && enableTimeSuffix.value()) {
            finalTableName = appendTimeSuffix(finalTableName, enableTimeSuffix.pattern());
        }
        return finalTableName;
    }

    /**
     * 获取表备注
     */
    public static String getTableComment(Class<?> clazz) {
        Table table = clazz.getAnnotation(Table.class);
        if (!hasTableAnnotation(clazz)) {
            return "";
        }
        if (table != null && StrUtil.isNotBlank(table.comment())) {
            return table.comment();
        }
        return "";
    }

    /**
     * 获取表字符集
     */
    public static MySqlCharset getTableCharset(Class<?> clazz) {
        Table table = clazz.getAnnotation(Table.class);
        if (!hasTableAnnotation(clazz)) {
            return null;
        }
        if (table != null && table.charset() != MySqlCharset.DEFAULT) {
            return table.charset();
        }
        return null;
    }

    /**
     * 获取表引擎类型
     */
    public static MySqlEngine getTableEngine(Class<?> clazz) {
        Table table = clazz.getAnnotation(Table.class);
        if (!hasTableAnnotation(clazz)) {
            return null;
        }
        if (table != null && table.engine() != MySqlEngine.DEFAULT) {
            return table.engine();
        }
        return null;
    }

    /**
     * 获取行名称
     * @return
     */
    public static String getColumnName(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        TableField tableField = field.getAnnotation(TableField.class);
        TableId tableId = field.getAnnotation(TableId.class);
        if (!hasColumn(field, clazz)) {
            return null;
        }
        if (column != null && StrUtil.isNotBlank(column.name())) {
            return column.name().toLowerCase().replace(SQL_ESCAPE_CHARACTER, "");
        }
        if (column != null && StrUtil.isNotBlank(column.value())) {
            return column.value().toLowerCase().replace(SQL_ESCAPE_CHARACTER, "");
        }
        if (tableField != null && StrUtil.isNotBlank(tableField.value()) && tableField.exist()) {
            return tableField.value().toLowerCase().replace(SQL_ESCAPE_CHARACTER, "");
        }
        if (tableId != null && StrUtil.isNotBlank(tableId.value())) {
            return tableId.value().replace(SQL_ESCAPE_CHARACTER, "");
        }
        return getBuildLowerName(field.getName()).replace(SQL_ESCAPE_CHARACTER, "");
    }

    /**
     * 获取数据库字段的排序
     */
    public static int getColumnOrder(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            return 0;
        }
        return Optional.ofNullable(column).map(Column::order).orElse(0);
    }

    /**
     * 获取构建小写表名称
     */
    private static String getBuildLowerName(String name) {
        return CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, name).toLowerCase();
    }

    /**
     * 是否是主键
     */
    public static boolean isKey(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            return false;
        }
        TableId tableId = field.getAnnotation(TableId.class);
        if (column != null && column.isKey()) {
            return true;
        }
        else {
            return null != tableId;
        }
    }

    /**
     * 是否是自增主键
     */
    public static boolean isAutoIncrement(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            return false;
        }
        return column != null && column.isAutoIncrement();
    }

    /**
     * 是否可以为空
     * @param field
     * @param clazz
     * @return
     */
    public static Boolean isNull(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            return true;
        }
        boolean isKey = isKey(field, clazz);
        // 主键默认为非空
        if (isKey) {
            return false;
        }
        if (column != null) {
            return column.isNull();
        }
        return true;
    }

    /**
     * 获取字段的备注
     */
    public static String getComment(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            return null;
        }
        if (column != null && StrUtil.isNotBlank(column.comment())) {
            return column.comment();
        }
        return "";
    }

    /**
     * 获取默认值
     */
    public static String getDefaultValue(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            return null;
        }
        if (column != null && !DEFAULT_VALUE.equals(column.defaultValue())) {
            return column.defaultValue();
        }
        return null;
    }

    /**
     * 获取 开启默认值原生模式
     */
    public static boolean getDefaultValueNative(Field field, Class<?> clazz) {
        IsNativeDefValue isNativeDefValue = field.getAnnotation(IsNativeDefValue.class);
        if (isNativeDefValue != null) {
            return isNativeDefValue.value();
        }
        if (field.getGenericType().toString().equals("class java.lang.String")
                || field.getGenericType().toString().equals("char")
                || field.getGenericType().toString().equals("class java.lang.Boolean")
                || field.getGenericType().toString().equals("boolean")) {
            return false;
        }
        return true;
    }

    /**
     * Mysql 类型和长度
     */
    public static MySqlTypeAndLength getMySqlTypeAndLength(Field field, Class<?> clazz) {
        Column column = getColumn(field, clazz);
        if (!hasColumn(field, clazz)) {
            throw new RuntimeException("字段名：" + field.getName() + "没有字段标识的注解，异常抛出！");
        }
        if (column != null && column.type() != MySqlFieldType.DEFAULT) {
            return buildMySqlTypeAndLength(field, column.type().toString().toLowerCase(), column.length(),
                    column.decimalLength());
        }
        // 类型为空根据字段类型去默认匹配类型
        MySqlFieldType mysqlType = JavaToMysqlType.javaToMysqlTypeMap.get(field.getGenericType().toString());
        if (mysqlType == null) {
            throw new RuntimeException("字段名：" + field.getName() + "不支持" + field.getGenericType().toString()
                    + "类型转换到mysql类型，仅支持JavaToMysqlType类中的类型默认转换，异常抛出！");
        }
        String sqlType = mysqlType.toString().toLowerCase();
        // 默认类型可以使用column来设置长度
        if (column != null) {
            return buildMySqlTypeAndLength(field, sqlType, column.length(), column.decimalLength());
        }
        return buildMySqlTypeAndLength(field, sqlType, 255, 0);
    }

    /**
     * 构建 Mysql 类型和长度
     */
    private static MySqlTypeAndLength buildMySqlTypeAndLength(Field field, String type, int length, int decimalLength) {
        MySqlTypeAndLength mySqlTypeAndLength = mySqlTypeAndLengthMap.get(type);
        if (mySqlTypeAndLength == null) {
            throw new RuntimeException("字段名：" + field.getName() + "使用的" + type
                    + "类型，没有配置对应的MySqlTypeConstant，只支持创建MySqlTypeConstant中类型的字段，异常抛出！");
        }
        MySqlTypeAndLength targetMySqlTypeAndLength = new MySqlTypeAndLength();
        BeanUtils.copyProperties(mySqlTypeAndLength, targetMySqlTypeAndLength);
        if (length != 255) {
            targetMySqlTypeAndLength.setLength(length);
        }
        if (decimalLength != 0) {
            targetMySqlTypeAndLength.setDecimalLength(decimalLength);
        }
        return targetMySqlTypeAndLength;
    }

    /**
     * 是否有 Table 注解
     */
    public static boolean hasTableAnnotation(Class<?> clazz) {
        Table table = clazz.getAnnotation(Table.class);
        return table != null;
    }

    /**
     * 本行是否需要进行处理,
     */
    public static boolean hasColumn(Field field, Class<?> clazz) {
        // 是否开启simple模式
        boolean isSimple = isSimple(clazz);
        // 不参与建表的字段
        String[] excludeFields = excludeFields(clazz);
        // 当前属性名在排除建表的字段内
        if (Arrays.asList(excludeFields).contains(field.getName())) {
            return false;
        }
        // 排除静态字段
        if (Modifier.isStatic(field.getModifiers())) {
            return false;
        }
        Column column = field.getAnnotation(Column.class);
        TableField tableField = field.getAnnotation(TableField.class);
        TableId tableId = field.getAnnotation(TableId.class);
        // 判断是否忽略该字段
        if (column != null && column.ignore()) {
            return false;
        }
        // 开启了simple模式
        if (column == null && (tableField == null || !tableField.exist()) && tableId == null) {
            return isSimple;
        }
        return true;
    }

    /**
     * 获取列注解
     */
    private static Column getColumn(Field field, Class<?> clazz) {
        // 不参与建表的字段
        String[] excludeFields = excludeFields(clazz);
        if (Arrays.asList(excludeFields).contains(field.getName())) {
            return null;
        }
        Column column = field.getAnnotation(Column.class);
        if (column != null) {
            return column;
        }
        // 是否开启simple模式
        // 开启了simple模式
        if (isSimple(clazz)) {
            return new ColumnImpl();
        }
        return null;
    }

    /**
     * 排除字段
     */
    private static String[] excludeFields(Class<?> clazz) {
        String[] excludeFields = {};
        Table tableName = clazz.getAnnotation(Table.class);
        if (tableName != null) {
            excludeFields = tableName.excludeFields();
        }
        return excludeFields;
    }

    /**
     * 是否是简单模式
     */
    private static boolean isSimple(Class<?> clazz) {
        boolean isSimple = false;
        Table tableName = clazz.getAnnotation(Table.class);
        if (tableName != null) {
            isSimple = tableName.isSimple();
        }
        return isSimple;
    }

    /**
     * 添加时间后缀
     * @param tableName 表名
     * @param pattern 时间格式
     * @return
     */
    public static String appendTimeSuffix(String tableName, String pattern) {
        String suffix;
        try {
            suffix = DateFormatUtils.format(new Date(), pattern);
        }
        catch (Exception e) {
            throw new RuntimeException("无法转换时间格式" + pattern);
        }
        return tableName + "_" + suffix;
    }

    /**
     * 初始化 mysql的类型
     */
    static {
        mySqlTypeAndLengthMap = new HashMap<>();
        for (MySqlFieldType type : MySqlFieldType.values()) {
            mySqlTypeAndLengthMap.put(type.toString().toLowerCase(), new MySqlTypeAndLength(type.getLengthCount(),
                    type.getLengthDefault(), type.getDecimalLengthDefault(), type.toString().toLowerCase()));
        }
    }

}
