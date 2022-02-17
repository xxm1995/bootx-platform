package cn.bootx.starter.code.gen.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**   
* 代码生成模板枚举
* @author xxm  
* @date 2022/2/17 
*/
@Getter
@AllArgsConstructor
public enum CodeGenTemplateVmEnum {
    ENTITY("entity","codegen/template/java/entity.java.vm"),
    REPOSITORY("repository","codegen/template/java/repository.java.vm"),
    MANAGER("manager","codegen/template/java/manager.java.vm"),
    SERVICE("service","codegen/template/java/service.java.vm"),
    CONTROLLER("controller","codegen/template/java/controller.java.vm"),
    DTO("dto","codegen/template/java/dto.java.vm"),
    PARAM("param","codegen/template/java/param.java.vm"),
    CONVERT("convert","codegen/template/java/convert.java.vm"),
    API_V2("api_v2","codegen/template/vue2/"),
    LIST_V2("list_v2","codegen/template/vue2/"),
    EDIT_V2("edit_v2","codegen/template/vue2/"),
    API_V3("api_v3","codegen/template/vue3/"),
    LIST_V3("list_v3","codegen/template/vue3/"),
    EDIT_V3("edit_v3","codegen/template/vue3/");


    private final String name;
    private final String path;
}
