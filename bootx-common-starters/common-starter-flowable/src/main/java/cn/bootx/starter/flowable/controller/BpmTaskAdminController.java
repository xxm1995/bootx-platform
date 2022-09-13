package cn.bootx.starter.flowable.controller;

import cn.bootx.starter.flowable.core.instance.service.BpmTaskAdminService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
 * 流程任务管理服务
 * @author xxm  
 * @date 2022/9/13 
 */
@Tag(name = "")
@RestController
@RequestMapping("/bpm/admin/task")
@RequiredArgsConstructor
public class BpmTaskAdminController {
    private final BpmTaskAdminService bpmTaskAdminService;
}
