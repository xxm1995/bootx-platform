package cn.bootx.common.mybatisplus.handler;

import cn.bootx.common.core.annotation.BigField;
import com.baomidou.mybatisplus.core.metadata.TableFieldInfo;

import java.util.Objects;

/**
* 长文本处理器
* @author xxm
* @date 2021/10/24
*/
public class MpBigFieldHandler {

    /**
     * 字段存在长文本注解则在查询时被排除
     */
    public static boolean excludeBigField(TableFieldInfo tableFieldInfo) {
        BigField annotation = tableFieldInfo.getField().getAnnotation(BigField.class);
        return Objects.isNull(annotation);
    }
}
