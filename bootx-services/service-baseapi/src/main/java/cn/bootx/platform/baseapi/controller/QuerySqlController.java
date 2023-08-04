package cn.bootx.platform.baseapi.controller;

import cn.bootx.platform.baseapi.core.sql.service.QuerySqlService;
import cn.bootx.platform.baseapi.param.sql.QueryFieldParam;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * SQL查询
 *
 * @author xxm
 * @since 2023/3/9
 */
@Tag(name = "SQL查询")
@RestController
@RequestMapping("/query/sql")
@RequiredArgsConstructor
public class QuerySqlController {

    private final QuerySqlService querySqlService;


    @Operation(summary = "分页查询")
    @GetMapping("/page")
    public ResResult<PageResult<Void>> page(){
        return Res.ok();
    }

    @Operation(summary = "新建")
    @PostMapping("/add")
    public ResResult<Void> add(){
        querySqlService.add();
        return Res.ok();
    }

    @Operation(summary = "修改")
    @PostMapping("/update")
    public ResResult<Void> update(){
        querySqlService.update();
        return Res.ok();
    }

    @Operation(summary = "测试SQL解析和执行")
    @PostMapping("/test")
    public ResResult<Void> test(@RequestBody Map<String, Object> map) {
        querySqlService.querySql(map);
        return Res.ok();
    }

    @Operation(summary = "通过SQL查出结果字段")
    @PostMapping("/queryFieldBySql")
    public ResResult<List<String>> queryFieldBySql(@RequestBody QueryFieldParam param) {
        return Res.ok(querySqlService.queryFieldBySql(param));
    }

}
