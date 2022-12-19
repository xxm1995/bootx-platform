package cn.bootx.demo.controller.bsp;

import cn.bootx.baseapi.core.dict.service.DictConvertService;
import cn.bootx.common.core.annotation.DictConvert;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author xxm
 * @date 2022/12/19
 */
@Tag(name = "字典测试")
@RestController
@RequestMapping("/demo/dict")
@RequiredArgsConstructor
public class DictConvertDemoController {
    private final DictConvertService dictConvertService;

    @Operation(summary = "convert")
    @GetMapping("/convert")
    public ResResult<DictDemo> convert(){
        DictDemox dictDemo = new DictDemox();
        dictDemo.setSex("1");
        dictDemo.setSocialType("DingTalk");
        dictDemo.setDataScopePerm("2");
        dictConvertService.convert(dictDemo);
        return Res.ok(dictDemo);
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @Accessors(chain = true)
    public static class DictDemo extends MpBaseEntity {

        /** 性别 */
        @DictConvert(dicCode = "Sex")
        private String sex;
        /** 三方系统类别 */
        @DictConvert(dicCode = "SocialType")
        private String socialType;
    }


    @EqualsAndHashCode(callSuper = true)
    @Data
    @Accessors(chain = true)
    public static class DictDemox extends DictDemo {

        /** 性别 */
        @DictConvert(dicCode = "Sex")
        private String sex;
        /** 三方系统类别 */
        @DictConvert(dicCode = "DataScopePerm")
        private String dataScopePerm;
    }
}
