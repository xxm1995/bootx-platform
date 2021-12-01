package cn.bootx.starter.query.controller;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.query.entity.QueryParams;
import cn.bootx.starter.query.generator.QueryGenerator;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
* 
* @author xxm  
* @date 2021/11/17 
*/
@Tag(name = "查询器配置")
@RestController
@RequestMapping("/query/config")
@RequiredArgsConstructor
public class QueryConfigConfig {

    @Operation(summary = "测试生成查询器")
    @PostMapping("/initQuery")
    public ResResult<Void> initQuery(@RequestBody QueryParams queryParams){
        System.out.println(queryParams);
        QueryWrapper<UserDetail> generator = QueryGenerator.generator(queryParams);
        System.out.println(generator.getExpression().getNormal());
        return Res.ok();
    }
}
