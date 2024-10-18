package cn.bootx.platform.baseapi.entity.chinaword;


import cn.bootx.platform.baseapi.convert.chinaword.ChinaWordConvert;
import cn.bootx.platform.baseapi.param.chinaword.ChinaWordParam;
import cn.bootx.platform.baseapi.result.chinaword.ChinaWordResult;
import cn.bootx.platform.common.mybatisplus.base.MpRealDelEntity;
import cn.bootx.platform.common.mybatisplus.function.ToResult;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 敏感词
 * @author xxm
 * @since 2023/8/8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName(value = "base_black_china_word",autoResultMap = true)
public class ChinaWord extends MpRealDelEntity implements ToResult<ChinaWordResult> {

    /** 敏感词 */
    private String word;
    /** 类型 */
    private String type;
    /** 描述 */
    private String description;
    /** 是否启用 */
    private Boolean enable;
    /** 是否是白名单名词 */
    private Boolean white;

    /** 创建对象 */
    public static ChinaWord init(ChinaWordParam in) {
        return ChinaWordConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public ChinaWordResult toResult() {
        return ChinaWordConvert.CONVERT.convert(this);
    }
}

