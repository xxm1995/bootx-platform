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
import lombok.experimental.FieldNameConstants;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author xxm
 * @date 2022/12/19
 */
@Tag(name = "字典测试")
@RestController
@RequestMapping("/demo/dict")
@RequiredArgsConstructor
public class DictConvertDemoController {

    private final DictTranslationService dictTranslationService;

    @Operation(summary = "转换测试(对象吧)")
    @GetMapping("/convert")
    @DictTranslation
    public ResResult<DictDemo> convert() {
        DictDemo dictDemo = new DictDemo()
                .setSex("1")
                .setSocialType("DingTalk")
                .setPerson(new Person()
                        .setSexCode(1));

        return Res.ok(dictDemo);
    }
    @Operation(summary = "转换测试(map)")
    @GetMapping("/c1")
    @DictTranslation(convertType = DictTranslation.ConvertType.MAP)
    public ResResult<DictDemo> c1() {
        DictDemo dictDemo = new DictDemo()
                .setSex("1")
                .setSocialType("DingTalk")
                .setPerson(new Person()
                        .setSexCode(1)
                        .setDataScopePerm(1));

        return Res.ok(dictDemo);
    }

    @Operation(summary = "c2")
    @GetMapping("/c2")
    @DictTranslation
    public String c2() {
        return "123";
    }

    @Operation(summary = "c4")
    @GetMapping("/c4")
    @DictTranslation
    public ResResult<List<String>> c4() {
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

        @DictTranslation
        private Person person;

    }

    @Data
    @Accessors(chain = true)
    @FieldNameConstants
    public static class Person {

        /** 性别 */
        private Integer sexCode;

        /** 性别 */
        @Dict(dicCode = "Sex",source = Fields.sexCode)
        private String sexName;

        /** 三方系统类别 */
        @Dict(dicCode = "DataScopePerm")
        private Integer dataScopePerm;

    }

}
