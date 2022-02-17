package cn.bootx.starter.code.gen.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.code.gen.service.CodeGeneratorService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
* 代码生成
* @author xxm  
* @date 2022/2/17 
*/
@Tag(name = "代码生成")
@RestController
@RequestMapping("/gen/code")
@RequiredArgsConstructor
public class CodeGeneratorController {
    private final CodeGeneratorService generatorService;

    @Operation(summary = "生成代码")
    @GetMapping("/codeGen")
    public ResResult<String> codeGen(String tableName){
        return Res.ok(generatorService.genEntity(tableName));
    }

}
