package cn.bootx.demo.controller.bsp;

import cn.bootx.baseapi.core.dict.service.DictTranslationService;
import cn.bootx.common.core.annotation.Dict;
import cn.bootx.common.core.annotation.DictTranslation;
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

import java.util.ArrayList;
import java.util.List;

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
    private final DictTranslationService dictTranslationService;

    @Operation(summary = "转换测试")
    @GetMapping("/convert")
    @DictTranslation
    public ResResult<DictDemo> convert(){
        DictDemox dictDemo = new DictDemox();
        dictDemo.setSex("1");
        dictDemo.setSocialType("DingTalk");
        dictDemo.setDataScopePerm("2");

//        dictTranslationService.translation(dictDemo);
//        dictTranslationService.translation(x);
        return Res.ok(dictDemo);
    }

    @Operation(summary = "c2")
    @GetMapping("/c2")
    @DictTranslation
    public String c2(){
        return "123";
    }

    @Operation(summary = "c4")
    @GetMapping("/c4")
    @DictTranslation
    public ResResult<List<String>> c4(){
        return Res.ok(new ArrayList<>());
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @Accessors(chain = true)
    public static class DictDemo extends MpBaseEntity {

        /** 性别 */
        @Dict(dicCode = "Sex")
        private String sex;
        /** 三方系统类别 */
        @Dict(dicCode = "SocialType")
        private String socialType;
    }


    @EqualsAndHashCode(callSuper = true)
    @Data
    @Accessors(chain = true)
    public static class DictDemox extends DictDemo {

        /** 性别 */
        @Dict(dicCode = "Sex")
        private String sex;
        /** 三方系统类别 */
        @Dict(dicCode = "DataScopePerm")
        private String dataScopePerm;

        private Integer age;
    }
}
