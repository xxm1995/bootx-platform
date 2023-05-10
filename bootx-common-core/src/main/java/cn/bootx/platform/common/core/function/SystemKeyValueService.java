package cn.bootx.platform.common.core.function;

import cn.bootx.platform.common.core.rest.dto.KeyValue;

import java.util.List;

/**
 * kv存储接口 (必须实现)
 *
 * @author xxm
 * @date 2022/6/13
 */
public interface SystemKeyValueService {

    /**
     * 获取值
     */
    String get(String key);

    /**
     * 获取多个
     */
    List<KeyValue> gets(List<String> keys);

    /**
     * 设置值
     */
    void setup(String key, String value);

    /**
     * 设置多个
     */
    void setupBatch(List<KeyValue> list);

}
