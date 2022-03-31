package cn.bootx.baseapi.core.keyvalue.service;

import cn.bootx.baseapi.core.keyvalue.dao.SysKeyValueManager;
import cn.bootx.baseapi.core.keyvalue.entity.SysKeyValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* kv存储
* @author xxm  
* @date 2022/3/30 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class SysKeyValueService {
    private final SysKeyValueManager sysKeyValueManager;

    /**
     * 获取值
     */
    public String get(String key){
        return sysKeyValueManager.findByField(SysKeyValue::getKey,key).map(SysKeyValue::getValue).orElse(null);
    }

    /**
     * 设置值
     */
    public void setup(String key,String value){
        SysKeyValue sysKeyValue = sysKeyValueManager.findByField(SysKeyValue::getKey, key).orElse(new SysKeyValue().setKey(key).setValue(value));
        sysKeyValueManager.saveOrUpdate(sysKeyValue);
    }
}
