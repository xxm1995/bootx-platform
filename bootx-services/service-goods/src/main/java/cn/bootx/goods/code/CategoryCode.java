package cn.bootx.goods.code;

/**
* 类目相关常量
* @author xxm
* @date 2022/5/9
*/
public interface CategoryCode {

    /** 根类目 id */
    long ID_ROOT = 0L;

    // 类目层级
    /** 一级类目 */
    int LEVEL_TOP = 1;
    /** 中间类目 */
    int LEVEL_MIDDLE = 2;
    /** 子孙类目 */
    int LEVEL_CHILD = 3;

}
