package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.core.instance.service.BpmInstanceAdminService;
import cn.bootx.starter.flowable.dto.instance.InstanceInfo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 流程实例管理服务
 *
 * @author xxm
 * @date 2022/9/17
 */
@Tag(name = "流程实例管理服务")
@RestController
@RequestMapping("/bpm/admin/instance")
@RequiredArgsConstructor
public class BpmInstanceAdminController {

    private final BpmInstanceAdminService adminService;

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<InstanceInfo>> page(@ParameterObject PageParam pageParam) {
        return Res.ok(adminService.page(pageParam));
    }

}
