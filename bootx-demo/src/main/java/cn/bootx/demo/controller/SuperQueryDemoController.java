package cn.bootx.demo.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*
* @author xxm
* @date 2022/2/21
*/
@Tag(name = "超级查询演示")
@RestController
@RequestMapping("/demo/")
@RequiredArgsConstructor
public class SuperQueryDemoController {
}
