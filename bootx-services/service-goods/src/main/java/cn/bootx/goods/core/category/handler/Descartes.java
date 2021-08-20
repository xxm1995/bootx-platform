package cn.bootx.goods.core.category.handler;

import java.util.ArrayList;
import java.util.List;

/**
* 未知维度集合的笛卡尔积
* @author xxm  
* @date 2020/11/21 
*/
public class Descartes {
    /**
     * 递归实现 dimValue 中的笛卡尔积，结果放在 result 中
     *
     * @param dimValue 原始数据
     * @param result   结果数据
     * @param layer    dimValue的层数
     * @param curList  每次笛卡尔积的结果
     */
    public static <T> void recursive(List<List<T>> dimValue, List<List<T>> result, int layer, List<T> curList) {
        if (layer < dimValue.size() - 1) {
            if (dimValue.get(layer).size() == 0) {
                recursive(dimValue, result, layer + 1, curList);
            } else {
                for (int i = 0; i < dimValue.get(layer).size(); i++) {
                    List<T> list = new ArrayList<>(curList);
                    list.add(dimValue.get(layer).get(i));
                    recursive(dimValue, result, layer + 1, list);
                }
            }
        } else if (layer == dimValue.size() - 1) {
            if (dimValue.get(layer).size() == 0) {
                result.add(curList);
            } else {
                for (int i = 0; i < dimValue.get(layer).size(); i++) {
                    List<T> list = new ArrayList<>(curList);
                    list.add(dimValue.get(layer).get(i));
                    result.add(list);
                }
            }
        }
    }
}
