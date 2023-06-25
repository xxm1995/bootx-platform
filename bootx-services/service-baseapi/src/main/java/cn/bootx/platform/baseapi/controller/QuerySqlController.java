package cn.bootx.platform.baseapi.controller;

import cn.bootx.platform.baseapi.core.sql.service.QuerySqlService;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.baseapi.param.sql.QueryFieldParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
