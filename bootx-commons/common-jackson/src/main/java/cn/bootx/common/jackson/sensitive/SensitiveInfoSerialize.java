package cn.bootx.common.jackson.sensitive;

import cn.hutool.core.util.DesensitizedUtil;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.IOException;
import java.util.Objects;

/**   
* 敏感信息脱敏序列化
* @author xxm  
* @date 2021/10/25 
*/
@AllArgsConstructor
@NoArgsConstructor
public class SensitiveInfoSerialize extends JsonSerializer<String> implements
        ContextualSerializer {

    private SensitiveInfo sensitiveInfo;

    @Override
    public void serialize(String s, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        switch (this.sensitiveInfo.value()) {
            case CHINESE_NAME: {
                jsonGenerator.writeString(DesensitizedUtil.chineseName(s));
                break;
            }
            case PASSWORD: {
                jsonGenerator.writeString(DesensitizedUtil.password(s));
                break;
            }
            case ID_CARD: {
                jsonGenerator.writeString(DesensitizedUtil.idCardNum(s,6,2));
                break;
            }
            case FIXED_PHONE: {
                jsonGenerator.writeString(DesensitizedUtil.fixedPhone(s));
                break;
            }
            case MOBILE_PHONE: {
                jsonGenerator.writeString(DesensitizedUtil.mobilePhone(s));
                break;
            }
            case ADDRESS: {
                jsonGenerator.writeString(DesensitizedUtil.address(s, 4));
                break;
            }
            case EMAIL: {
                jsonGenerator.writeString(DesensitizedUtil.email(s));
                break;
            }
            case BANK_CARD: {
                jsonGenerator.writeString(DesensitizedUtil.bankCard(s));
                break;
            }
            case CNAPS_CODE: {
                jsonGenerator.writeString(DesensitizedUtil.idCardNum(s,4,4));
                break;
            }
            case OTHER: {
                jsonGenerator.writeString(DesensitizedUtil.idCardNum(s,sensitiveInfo.front(),sensitiveInfo.end()));
                break;
            }
            default:{
                jsonGenerator.writeString(s);
            }
        }

    }

    @Override
    public JsonSerializer<?> createContextual(SerializerProvider serializerProvider, BeanProperty beanProperty) throws JsonMappingException {
        if (beanProperty != null) { // 为空直接跳过
            if (Objects.equals(beanProperty.getType().getRawClass(), String.class)) { // 非 String 类直接跳过
                SensitiveInfo sensitiveInfo = beanProperty.getAnnotation(SensitiveInfo.class);
                if (sensitiveInfo == null) {
                    sensitiveInfo = beanProperty.getContextAnnotation(SensitiveInfo.class);
                }
                if (sensitiveInfo != null) { // 如果能得到注解，就将注解的 value 传入 SensitiveInfoSerialize
                    return new SensitiveInfoSerialize(sensitiveInfo);
                }
            }
            return serializerProvider.findValueSerializer(beanProperty.getType(), beanProperty);
        }
        return serializerProvider.findNullValueSerializer(null);
    }

}
