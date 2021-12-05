package cn.bootx.common.jackson.jdk;

import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

/**
* Long 类型序列化为String
* @author xxm  
* @date 2020/4/14 13:35
*/
public class JavaLongTypeModule extends SimpleModule {
    public JavaLongTypeModule() {
        // 将 Long 转 String
        this.addSerializer(Long.TYPE, ToStringSerializer.instance);
        this.addSerializer(Long.class, ToStringSerializer.instance);
    }
}
