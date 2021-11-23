package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.client.service.ClientService;
import cn.bootx.iam.dto.client.ClientDto;
import cn.bootx.iam.param.client.ClientParam;
import cn.bootx.starter.query.entity.QueryParams;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* 终端
* @author xxm
* @date 2021/8/25
*/
@Api(tags = "终端管理")
@RestController
@RequestMapping("/client")
@RequiredArgsConstructor
public class ClientController {
    private final ClientService clientService;

    @ApiOperation(value = "添加终端")
    @PostMapping(value = "/add")
    public ResResult<ClientDto> add(@RequestBody ClientParam param){
        return Res.ok(clientService.add(param));
    }

    @ApiOperation(value = "修改终端（返回终端对象）")
    @PostMapping(value = "/update")
    public ResResult<ClientDto> update(@RequestBody ClientParam param){
        return Res.ok(clientService.update(param));
    }

    @ApiOperation(value = "删除终端")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        clientService.delete(id);
        return Res.ok();
    }

    @ApiOperation(value = "通过ID查询终端")
    @GetMapping(value = "/findById")
    public ResResult<ClientDto> findById(Long id){
        return Res.ok(clientService.findById(id));
    }

    @IgnoreAuth
    @ApiOperation(value = "通过code查询终端")
    @GetMapping(value = "/findByCode")
    public ResResult<ClientDto> findByCode(String code){
        return Res.ok(clientService.findByCode(code));
    }

    @ApiOperation(value = "查询所有的终端")
    @GetMapping(value = "/findAll")
    public ResResult<List<ClientDto>> findAll(){
        return Res.ok(clientService.findAll());
    }

    @ApiOperation(value = "分页查询终端")
    @GetMapping(value = "/page")
    public ResResult<PageResult<ClientDto>> page(PageParam pageParam, ClientParam clientParam){
        return Res.ok(clientService.page(pageParam,clientParam));
    }

    @ApiOperation("超级分页")
    @PostMapping("/superPage")
    public ResResult<PageResult<ClientDto>> superPage(PageParam pageParam,@RequestBody QueryParams queryParams){
        return Res.ok(clientService.superPage(pageParam,queryParams));
    }
    
    @ApiOperation(value = "编码是否被使用")
    @GetMapping("/existsByCode")
    public ResResult<Boolean> existsByCode(String code) {
        return Res.ok(clientService.existsByCode(code));
    }

    @ApiOperation(value = "编码是否被使用(不包含自己)")
    @GetMapping("/existsByCodeNotId")
    public ResResult<Boolean> existsByCode(String code,Long id) {
        return Res.ok(clientService.existsByCode(code,id));
    }
}
