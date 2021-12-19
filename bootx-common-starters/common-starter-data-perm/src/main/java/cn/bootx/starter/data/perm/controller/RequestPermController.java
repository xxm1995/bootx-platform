package cn.bootx.starter.data.perm.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.data.perm.request.entity.RequestPerm;
import cn.bootx.starter.data.perm.request.service.RequestPermService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**   
* 请求权限
* @author xxm  
* @date 2021/12/19 
*/
@Tag(name = "请求权限")
@RestController
@RequestMapping("/perm/request")
@RequiredArgsConstructor
public class RequestPermController {
    private final RequestPermService requestPermService;

    @Operation(summary = "获取系统请求列表")
    @PostMapping("/getSystemRequest")
    public ResResult<List<RequestPerm>> getSystemRequest(){
        return Res.ok(requestPermService.getSystemRequests());
    }
}
