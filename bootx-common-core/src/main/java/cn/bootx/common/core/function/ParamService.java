package cn.bootx.common.core.function;

/**
* 参数获取服务(必须有实现类)
* @author xxm
* @date 2022/5/1
*/
public interface ParamService {

    /**
     * 获取 参数值
     */
    String getValue(String key);
}
