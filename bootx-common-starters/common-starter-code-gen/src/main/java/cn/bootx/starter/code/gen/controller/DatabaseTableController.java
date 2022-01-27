package cn.bootx.starter.code.gen.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.code.gen.entity.DatabaseColumn;
import cn.bootx.starter.code.gen.entity.DatabaseTable;
import cn.bootx.starter.code.gen.service.DatabaseTableService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* @author xxm
* @date 2022/1/27
*/
@Tag(name = "数据库表信息")
@RestController
@RequestMapping("/gen/table")
@RequiredArgsConstructor
public class DatabaseTableController {
    private final DatabaseTableService databaseTableService;
    
    @Operation(summary = "表列表")
    @GetMapping("/findAll")
    public ResResult<List<DatabaseTable>> findAll(){
        return Res.ok(databaseTableService.findAll());
    }

    @Operation(summary = "表列表分页")
    @GetMapping("/page")
    public ResResult<Page<DatabaseTable>> page(@ParameterObject PageParam pageParam){
        return Res.ok(databaseTableService.page(pageParam));
    }

    @Operation(summary = "获取表信息")
    @GetMapping("/findByTableName")
    public ResResult<DatabaseTable> findByTableName(String tableName){
        return Res.ok(databaseTableService.findByTableName(tableName));
    }

    @Operation(summary = "获取数据表行信息")
    @GetMapping("/findColumnByTableName")
    public ResResult<List<DatabaseColumn>> findColumnByTableName(String tableName){
        return Res.ok(databaseTableService.findColumnByTableName(tableName));
    }
}
