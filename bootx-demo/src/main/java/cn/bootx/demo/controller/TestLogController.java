package cn.bootx.demo.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.starter.audit.log.param.DataVersionLogParam;
import cn.bootx.starter.audit.log.service.DataVersionLogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
* 测试日志
* @author xxm
* @date 2022/1/10
*/
@Tag(name = "测试日志")
@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class TestLogController {
    private final DataVersionLogService dataVersionLogService;


    @Operation(summary = "测试数据版本日志")
    @PostMapping("/testDataVersion")
    public ResResult<Void> testDataVersion(String msg){
        Client client = new Client();
        client.setName(msg);
        client.setId(1L);
        client.setCreateTime(LocalDateTime.now());
        dataVersionLogService.add(new DataVersionLogParam().setDataId(String.valueOf(client.getId())).setDataName("client").setDataContent(client));
        return Res.ok();
    }
}
