package cn.bootx.starter.flowable.controller;

import cn.bootx.starter.flowable.core.model.service.BpmAssistService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 工作流基础支撑接口
 * @author xxm
 * @date 2023/3/28
 */
@Tag(name = "工作流基础支撑接口")
@RestController
@RequestMapping("/bpm/assist")
@RequiredArgsConstructor
public class BpmAssistControl {
    private final BpmAssistService bpmAssistService;
}
