package cn.bootx.common.mybatisplus.util;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 工具类
 * @author xxm
 * @date 2020/4/21 10:00
 */
public class MpUtils {
	/**
	 * mp page转换为 PageResult 同时进行dto转换
	 */
	public static <T> PageResult<T> convert2PageResult(Page<? extends EntityBaseFunction<T>> page){
		if (Objects.isNull(page)){
			return new PageResult<>();
		}
		List<T> collect = page.getRecords()
				.stream()
				.map(EntityBaseFunction::toDto)
				.collect(Collectors.toList());
		// 构造 PageResult 对象
		return new PageResult<T>()
				.setSize(page.getSize())
				.setCurrent(page.getCurrent())
				.setTotal(page.getTotal())
				.setRecords(collect);
	}

    /**
     * page转换为 PageResult
     */
    public static <T> PageResult<T> page2PageResult(Page<T> page){
        if (Objects.isNull(page)){
            return new PageResult<>();
        }
        // 构造 PageResult 对象
        return new PageResult<T>()
                .setSize(page.getSize())
                .setCurrent(page.getCurrent())
                .setTotal(page.getTotal())
                .setRecords(page.getRecords());
    }

    /**
     * 获取分页对象 MyBatis-Plus
     */
    public static <T> Page<T> getMpPage(PageParam page, Class<T> clazz){
        return Page.of(page.getCurrent(),page.getSize());
    }

}
