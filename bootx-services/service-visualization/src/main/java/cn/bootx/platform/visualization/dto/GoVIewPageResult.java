package cn.bootx.platform.visualization.dto;

import cn.bootx.platform.common.core.rest.ResResult;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * GoView分页
 *
 * @author xxm
 * @since 2023/2/21
 */
@Getter
@Setter
@ToString
public class GoVIewPageResult<T> extends ResResult<T> {

    /** 数据条数 */
    private int count;

}
