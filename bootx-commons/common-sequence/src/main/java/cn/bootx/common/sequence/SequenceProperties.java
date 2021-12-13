package cn.bootx.common.sequence;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
* 发号器参数
* @author xxm
* @date 2021/8/6
*/
@Getter
@Setter
@ConfigurationProperties("bootx.common.sequence")
public class SequenceProperties {

    /**
     * 前缀防止key重复
     */
    private String keyPrefix = "Sequence:";

    /**
     * 步长
     */
    private int step = 1;

    /**
     * 区间步长
     */
    private int rangeStep = 1000;

    /**
     * 区间起始位置
     */
    private long rangeStart = 0;
}
