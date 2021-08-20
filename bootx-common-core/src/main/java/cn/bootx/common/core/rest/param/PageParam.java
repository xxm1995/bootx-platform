package cn.bootx.common.core.rest.param;

import cn.hutool.core.util.PageUtil;
import io.swagger.annotations.ApiModel;

import java.io.Serializable;

/**
 * 分页查询参数
 */
@ApiModel("分页查询参数")
public class PageParam implements Serializable {

    private static final long serialVersionUID = 7489222986629492487L;
    /**
     * 当前页
     */
    private int current = 1;

    /**
     * 每页显示条数，默认 10
     */
    private int size = 10;

    /**
     * 开始条数
     */
    public int start(){
        return PageUtil.transToStartEnd(current,size)[0];
    }

    /**
     * 结束条数
     */
    public int end(){
        return PageUtil.transToStartEnd(current,size)[1];
    }

    public int getCurrent() {
        return current;
    }

    public PageParam setCurrent(int current) {
        this.current = current;
        return this;
    }

    public int getSize() {
        return size;
    }

    public PageParam setSize(int size) {
        this.size = size;
        return this;
    }
}
