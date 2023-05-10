package cn.bootx.platform.common.translate.domain;

import cn.bootx.platform.common.core.annotation.Translate;
import cn.bootx.platform.common.core.annotation.TranslationResult;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.lang.reflect.Field;

/**
 * 字段信息
 *
 * @author xxm
 * @date 2023/1/31
 */
@Getter
@Setter
@Accessors(chain = true)
public class ConvertInfo {

    // 字段名
    private String name;

    // 所属字段属性
    private Field field;

    // 翻译注解
    private Translate translate;

    // 嵌套翻译注解
    private TranslationResult translationResult;

}
