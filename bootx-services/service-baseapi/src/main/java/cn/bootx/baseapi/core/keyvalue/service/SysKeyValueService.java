package cn.bootx.baseapi.core.keyvalue.service;

import cn.bootx.baseapi.core.keyvalue.dao.SysKeyValueManager;
import cn.bootx.baseapi.core.keyvalue.entity.SysKeyValue;
import cn.bootx.common.core.function.SystemKeyValueService;
import cn.bootx.common.core.rest.dto.KeyValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * kv存储
 *
 * @author xxm
 * @date 2022/3/30
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SysKeyValueService implements SystemKeyValueService {

    private final SysKeyValueManager sysKeyValueManager;

    /**
     * 获取值
     */
    @Override
    public String get(String key) {
        return sysKeyValueManager.findByField(SysKeyValue::getKey, key).map(SysKeyValue::getValue).orElse(null);
    }

    /**
     * 获取多个
     */
    @Override
    public List<KeyValue> gets(List<String> keys) {
        return sysKeyValueManager.findAllByFields(SysKeyValue::getKey, keys)
            .stream()
            .map(SysKeyValue::toKeyValue)
            .collect(Collectors.toList());
    }

    /**
     * 设置值
     */
    @Override
    public void setup(String key, String value) {
        SysKeyValue sysKeyValue = sysKeyValueManager.findByField(SysKeyValue::getKey, key)
            .orElse(new SysKeyValue().setKey(key).setValue(value));
        sysKeyValueManager.saveOrUpdate(sysKeyValue);
    }

    /**
     * 设置多个
     */
    @Override
    public void setupBatch(List<KeyValue> list) {

    }

}
