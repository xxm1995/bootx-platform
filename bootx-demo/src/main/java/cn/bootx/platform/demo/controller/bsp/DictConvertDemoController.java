package cn.bootx.platform.demo.controller.bsp;

import cn.bootx.platform.baseapi.core.dict.service.DictTranslationServiceImpl;
import cn.bootx.platform.common.core.annotation.Translate;
import cn.bootx.platform.common.core.annotation.TranslationResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
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
import java.util.Arrays;
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

    private final DictTranslationServiceImpl dictTranslationService;

    @Operation(summary = "转换测试(对象)")
    @GetMapping("/convert")
    @TranslationResult
    public ResResult<DictDemo> convert() throws NoSuchMethodException {

        DictDemo dictDemo = new DictDemo().setSex("1")
            .setSexInt(1)
            .setSocialType("DingTalk")
            .setSocialTypes(Arrays.asList("123", "DingTalk"))
            .setPerson(new Person().setSexCode(1));

        return Res.ok(dictDemo);
    }

    @Operation(summary = "转换测试(map)")
    @GetMapping("/c1")
    @TranslationResult(convertType = TranslationResult.ConvertType.MAP)
    public ResResult<DictDemo> c1() {
        DictDemo dictDemo = new DictDemo().setSex("1")
            .setSocialType("DingTalk")
            .setSocialTypes(Arrays.asList("123", "DingTalk"))
            .setPerson(new Person().setSexCode(1).setDataScopePerm(1));

        return Res.ok(dictDemo);
    }

    @Operation(summary = "c2")
    @GetMapping("/c2")
    @TranslationResult
    public String c2() {
        return "123";
    }

    @Operation(summary = "c4")
    @GetMapping("/c4")
    @TranslationResult
    public ResResult<List<String>> c4() {
        return Res.ok(new ArrayList<>());
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @Accessors(chain = true)
    public static class DictDemo extends MpBaseEntity {

        /** 性别 */
        @Translate(type = Translate.Type.DICT, dicCode = "Sex")
        private String sex;

        /** 性别 */
        @Translate(type = Translate.Type.DICT, dicCode = "Sex")
        private Integer sexInt;

        /** 三方系统类别 */
        @Translate(type = Translate.Type.DICT, dicCode = "SocialType")
        private String socialType;

        @TranslationResult
        private Person person;

        @Translate(type = Translate.Type.DICT, dicCode = "SocialType")
        private List<String> socialTypes;

    }

    @Data
    @Accessors(chain = true)
    @FieldNameConstants
    public static class Person {

        /** 性别 */
        private Integer sexCode;

        /** 性别 */
        @Translate(type = Translate.Type.DICT, dicCode = "Sex", source = Fields.sexCode)
        private String sexName;

        /** 三方系统类别 */
        @Translate(type = Translate.Type.DICT, dicCode = "DataScopePerm")
        private Integer dataScopePerm;

    }

}
