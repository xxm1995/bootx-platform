package cn.bootx.common.actable.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 通过包名获取class
 *
 * @author sunchenbin
 * @version 2016年6月23日 下午5:55:18
 */
public class ClassTools {

    /**
     * 取出list对象中的某个属性的值作为list返回
     * @param objList
     * @param fieldName
     * @return
     */
    public static <T, E> List<E> getPropertyValueList(List<T> objList, String fieldName) {
        List<E> list = new ArrayList<E>();
        try {
            for (T object : objList) {
                Field field = object.getClass().getDeclaredField(fieldName);
                field.setAccessible(true);
                list.add((E) field.get(object));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * List中的string转换为大写
     * @param list
     * @return
     */
    public static List<String> toLowerCase(List<String> list) {
        if (null == list || list.size() == 0) {
            return list;
        }
        List<String> upperList = new ArrayList<String>();
        for (String str : list) {
            upperList.add(str.toLowerCase());
        }
        return upperList;
    }

}
