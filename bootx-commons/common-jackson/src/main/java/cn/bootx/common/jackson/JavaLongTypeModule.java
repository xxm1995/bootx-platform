package cn.bootx.common.jackson;

import com.fasterxml.jackson.core.json.PackageVersion;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

/**
* Long 培训序列化为String
* @author xxm  
* @date 2020/4/14 13:35
*/
public class JavaLongTypeModule extends SimpleModule {
    public JavaLongTypeModule() {
        super(PackageVersion.VERSION);
        // 将 Long 转 String
        this.addSerializer(Long.TYPE, ToStringSerializer.instance);
        this.addSerializer(Long.class, ToStringSerializer.instance);
    }
}
