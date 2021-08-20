package cn.bootx.common.core.util;

import cn.hutool.core.collection.CollUtil;

import java.util.Collection;

/**
* 集合工具类
* @author xxm
* @date 2020/11/28
*/
public class CollUtils {

    /**
     * 判断两个集合是否有交集
     */
    public static <T> boolean contains(Collection<T> coll1, Collection<T> coll2){
        Collection<T> intersection = CollUtil.intersection(coll1, coll2);
        return CollUtil.isNotEmpty(intersection);
    }
}
