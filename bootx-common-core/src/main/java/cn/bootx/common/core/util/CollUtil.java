package cn.bootx.common.core.util;

import lombok.experimental.UtilityClass;

import java.util.Collection;

/**
* 集合工具类
* @author xxm
* @date 2020/11/28
*/
@UtilityClass
public class CollUtil {

    /**
     * 判断两个集合是否有交集
     */
    public <T> boolean contains(Collection<T> coll1, Collection<T> coll2){
        Collection<T> intersection = cn.hutool.core.collection.CollUtil.intersection(coll1, coll2);
        return cn.hutool.core.collection.CollUtil.isNotEmpty(intersection);
    }
}
