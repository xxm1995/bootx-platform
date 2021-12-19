package cn.bootx.demo.core.service;

import cn.hutool.core.annotation.AnnotationUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

@Slf4j
@Service
@RequiredArgsConstructor
public class TestService {
    private final WebApplicationContext applicationContext;

    public void xx() {
        RequestMappingHandlerMapping mapping = applicationContext.getBean(RequestMappingHandlerMapping.class);
        // 获取url与类和方法的对应信息
        Map<RequestMappingInfo, HandlerMethod> map = mapping.getHandlerMethods();
        for (RequestMappingInfo requestMappingInfo : map.keySet()) {
            HandlerMethod handlerMethod = map.get(requestMappingInfo);
            // 请求类型
            System.out.println(requestMappingInfo.getMethodsCondition().getMethods());
            // 请求路径
            Set<String> patternValues = requestMappingInfo.getPathPatternsCondition().getPatternValues();
            System.out.println(patternValues);
            // 请求描述
            Method method = handlerMethod.getMethod();
            Operation annotation = AnnotationUtil.getAnnotation(method, Operation.class);
            String summary = annotation.summary();
            System.out.println(summary);
            // 请求方法名称
            System.out.println(method.getName());
            // bean 名称 / 描述
            Class<?> declaringClass = method.getDeclaringClass();
            System.out.println(declaringClass.getSimpleName());
            Tag tag = AnnotationUtil.getAnnotation(declaringClass, Tag.class);
            System.out.println(tag.name());
            System.out.println();
        }
    }
}
