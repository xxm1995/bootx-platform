package cn.bootx.starter.code.gen.service;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.starter.code.gen.code.CodeGenColumnTypeEnum;
import cn.bootx.starter.code.gen.code.CodeGenTemplateVmEnum;
import cn.bootx.starter.code.gen.dto.CodeGenPreview;
import cn.bootx.starter.code.gen.entity.CodeGenColumn;
import cn.bootx.starter.code.gen.entity.DatabaseColumn;
import cn.bootx.starter.code.gen.entity.DatabaseTable;
import cn.bootx.starter.code.gen.param.CodeGenParam;
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

    // 初始化Velocity
    static {
        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);
    }

    /**
     * 生成实体类
     */
    public List<CodeGenPreview> codeGenPreview(CodeGenParam codeGenParam){
        // 获取生成代码所用的数据
        Map<String, Object> map = this.getCodeGenInfo(codeGenParam);
        // 遍历生成代码预览
        return Arrays.stream(CodeGenTemplateVmEnum.values())
                .map(vmEnum -> {
                    VelocityContext context = new VelocityContext(map);
                    StringWriter sw = new StringWriter();
                    Template template = Velocity.getTemplate(vmEnum.getPath(), CharsetUtil.UTF_8);
                    template.merge(context, sw);
                    return new CodeGenPreview()
                            .setName(vmEnum.getName())
                            .setContent(sw.toString());
                }).collect(Collectors.toList());
    }

    /**
     * 获取生成代码所用的数据
     */
    private Map<String,Object> getCodeGenInfo(CodeGenParam codeGenParam){
        DatabaseTable databaseTable = databaseTableService.findByTableName(codeGenParam.getTableName());
        List<DatabaseColumn> databaseColumns = databaseTableService.findColumnByTableName(codeGenParam.getTableName());

        Map<String, Object> map = new HashMap<>(16);
        // 数据库字段
        List<CodeGenColumn> columns = databaseColumns.stream()
                .map(databaseColumn -> new CodeGenColumn()
                        .setComments(databaseColumn.getColumnComment())
                        .setAttrType(CodeGenColumnTypeEnum.convertJavaType(databaseColumn.getDataType()))
                        .setName(NamingCase.toCamelCase(databaseColumn.getColumnName())))
                .filter(codeGenColumn->!entityFilterFields.contains(codeGenColumn.getName()))
                .collect(Collectors.toList());

        // 添加代码生成所需要的属性
        map.put("module",codeGenParam.getModule());
        map.put("method",codeGenParam.getMethod());
        map.put("comments",databaseTable.getTableComment());
        map.put("author",codeGenParam.getAuthor());
        map.put("datetime", DateUtil.formatDate(new Date()));
        map.put("className",tableToJava(databaseTable.getTableName()));
        map.put("tableName",databaseTable.getTableName());
        map.put("columns",columns);
        return map;
    }

    /**
     * 表名转换成Java类名 大驼峰
     */
    public static String tableToJava(String tableName) {
        // 自动去除表前缀
        return NamingCase.toPascalCase(tableName.substring(tableName.indexOf("_") + 1));
    }
}
