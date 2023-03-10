package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.sql.service.QuerySqlService;
import cn.bootx.baseapi.param.sql.QueryFieldParam;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * SQL查询
 * @author xxm
 * @date 2023/3/9
 */
@Tag(name = "SQL查询")
@RestController
@RequestMapping("/query/sql")
@RequiredArgsConstructor
public class QuerySqlController {
    private final QuerySqlService querySqlService;

    @Operation(summary = "测试SQL解析和执行")
    @PostMapping("/test")
    public ResResult<Void> test(){
        querySqlService.querySql();
        return Res.ok();
    }

    @Operation(summary = "测试SQL解析和执行")
    @PostMapping("/queryFieldBySql")
    public ResResult<Void> queryFieldBySql(@RequestBody QueryFieldParam param){
        querySqlService.queryFieldBySql(param);
        return Res.ok();
    }
}
