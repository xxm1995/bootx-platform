package cn.bootx.starter.auth.authentication;

/**
* 路由拦截检查
* @author xxm
* @date 2021/12/21
*/
public interface RouterCheck {

    /**
     * 排序
     */
    default int sortNo(){
        return 0;
    }

    /**
     * 路由
     */
    boolean check(Object handler);
}
