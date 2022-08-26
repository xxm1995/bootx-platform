package cn.bootx.office.controller;

import cn.bootx.office.core.instance.service.BpmTaskService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
 *
 * @author xxm  
 * @date 2022/8/24 
 */
@Tag(name = "流程任务")
@RestController
@RequestMapping("/bpm/task")
@RequiredArgsConstructor
public class BpmTaskController {
    private BpmTaskService bpmTaskService;

}
