package cn.bootx.platform.miniapp.controller;

import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.miniapp.core.protocol.service.UserProtocolService;
import cn.bootx.platform.miniapp.dto.protocol.UserProtocolDto;
import cn.bootx.platform.miniapp.param.protocol.UserProtocolParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@Tag(name ="用户协议")
@RestController
@RequestMapping("/user/protocol")
@RequiredArgsConstructor
public class UserProtocolController {
    private final UserProtocolService userProtocolService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody UserProtocolParam param){
        userProtocolService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody UserProtocolParam param){
        userProtocolService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        userProtocolService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<UserProtocolDto> findById(Long id){
        return Res.ok(userProtocolService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<UserProtocolDto>> findAll(){
        return Res.ok(userProtocolService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<UserProtocolDto>> page(PageParam pageParam, UserProtocolParam userProtocolParam){
        return Res.ok(userProtocolService.page(pageParam,userProtocolParam));
    }
}
