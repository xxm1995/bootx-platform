package cn.bootx.demo.controller;

import cn.bootx.common.core.annotation.Idempotent;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
* 幂等控制演示
* @author xxm  
* @date 2022/3/31 
*/
@Slf4j
@Tag(name ="幂等控制演示")
@RestController
@RequestMapping("/demo/idempotency")
@RequiredArgsConstructor
public class IdempotencyDemoController {

    @Idempotent(name = "idempotent",timeout = 1000)
    @Operation(summary = "幂等演示")
    @PostMapping("/test")
    public ResResult<String> Idempotent(){
        return Res.ok("幂等演示");
    }

}
