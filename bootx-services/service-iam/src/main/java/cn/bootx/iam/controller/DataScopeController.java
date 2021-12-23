package cn.bootx.iam.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*
* @author xxm
* @date 2021/12/23
*/
@Tag(name = "数据范围权限配置")
@RestController
@RequestMapping("/data/scope")
@RequiredArgsConstructor
public class DataScopeController {
}
