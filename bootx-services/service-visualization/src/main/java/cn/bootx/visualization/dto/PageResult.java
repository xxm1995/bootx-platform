package cn.bootx.visualization.dto;

import cn.bootx.common.core.rest.ResResult;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * GoView分页
 * @author xxm
 * @date 2023/2/21
 */
@Getter
@Setter
@ToString
public class PageResult<T> extends ResResult<T> {

    /** 数据条数 */
    private Integer count;
}
