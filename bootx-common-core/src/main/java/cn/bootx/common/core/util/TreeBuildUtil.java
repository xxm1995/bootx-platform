package cn.bootx.common.core.util;

import cn.hutool.core.collection.CollectionUtil;
import lombok.experimental.UtilityClass;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 构建数据树工具类
 * @author xxm
 * @date 2022/12/24
 */
@UtilityClass
public class TreeBuildUtil {

    /**
     * 构建成树
     */
    public <T> List<T> build(List<T> list,
                             Object pid,
                             Function<T, Object> getId,
                             Function<T, Object> getPid,
                             BiConsumer<T, List<T>> setChildren){
        return build(list,pid,getId,getPid,setChildren,null);
    }

    /**
     * 构建成树
     */
    public <T> List<T> build(List<T> list,
                             Object pid,
                             Function<T, Object> getId,
                             Function<T, Object> getPid,
                             BiConsumer<T, List<T>> setChildren,
                             Comparator<? super T> comparator){
        List<T> children = list.stream()
                .filter(m -> Objects.equals(getPid.apply(m),pid))
                .collect(Collectors.toList());
        if (CollectionUtil.isEmpty(children)) {
            return new ArrayList<>(0);
        }
        //
        for (T region : children) {
            List<T> childrenList = build(list, getId.apply(region), getId, getPid, setChildren);
            setChildren.accept(region,childrenList);
        }
        // 排序
        if (Objects.nonNull(comparator)){
            children.sort(comparator);
        }
        return children;
    }
}
