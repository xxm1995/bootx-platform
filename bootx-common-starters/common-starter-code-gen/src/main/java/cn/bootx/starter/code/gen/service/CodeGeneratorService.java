package cn.bootx.starter.code.gen.service;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.starter.code.gen.code.CodeGenColumnTypeEnum;
import cn.bootx.starter.code.gen.code.CodeGenTemplateVmEnum;
import cn.bootx.starter.code.gen.entity.CodeGenColumn;
import cn.bootx.starter.code.gen.entity.DatabaseColumn;
import cn.bootx.starter.code.gen.entity.DatabaseTable;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.NamingCase;
import cn.hutool.core.util.CharsetUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.stereotype.Service;

import java.io.StringWriter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 代码生成模板
 * @author xxm
 * @date 2022/1/27
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CodeGeneratorService {
    private final DatabaseTableService databaseTableService;

    /** 生成实体类时要过滤掉的字段 */
    private final List<String> entityFilterFields = Arrays.asList(
            CommonCode.ID,
            CommonCode.CREATOR,
            CommonCode.CREATE_TIME,
            CommonCode.LAST_MODIFIER,
            CommonCode.LAST_MODIFIED_TIME,
            CommonCode.VERSION,
            CommonCode.DELETED
    );

    /**
     * 生成实体类
     */
    public String genEntity(String tableName){

        DatabaseTable databaseTable = databaseTableService.findByTableName(tableName);
        List<DatabaseColumn> databaseColumns = databaseTableService.findColumnByTableName(tableName);

        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);
        Template template = Velocity.getTemplate(CodeGenTemplateVmEnum.ENTITY.getPath(), CharsetUtil.UTF_8);

        Map<String, Object> map = new HashMap<>(16);
        // 字段
        List<CodeGenColumn> columns = databaseColumns.stream()
                .map(databaseColumn -> new CodeGenColumn()
                        .setComments(databaseColumn.getColumnComment())
                        .setAttrType(CodeGenColumnTypeEnum.convertJavaType(databaseColumn.getDataType()))
                        .setName(NamingCase.toCamelCase(databaseColumn.getColumnName())))
                .filter(codeGenColumn->!entityFilterFields.contains(codeGenColumn.getName()))
                .collect(Collectors.toList());

        map.put("module","iam");
        map.put("method","client");
        map.put("comments",databaseTable.getTableComment());
        map.put("author","xxm");
        map.put("datetime", DateUtil.formatDate(new Date()));
        map.put("className",tableToJava(databaseTable.getTableName()));
        map.put("tableName",databaseTable.getTableName());
        map.put("columns",columns);

        VelocityContext context = new VelocityContext(map);
        StringWriter sw = new StringWriter();
        template.merge(context, sw);
        System.out.println(sw.toString());
        return sw.toString();
    }


    /**
     * 表名转换成Java类名 大驼峰
     */
    public static String tableToJava(String tableName) {
        // 自动去除表前缀
        return NamingCase.toPascalCase(tableName.substring(tableName.indexOf("_") + 1));
    }
}
