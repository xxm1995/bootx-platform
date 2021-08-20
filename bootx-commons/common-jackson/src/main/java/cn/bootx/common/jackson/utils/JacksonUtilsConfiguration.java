package cn.bootx.common.jackson.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.annotation.Configuration;

import javax.validation.constraints.NotNull;

/**   
*
* @author xxm  
* @date 2021/7/6 
*/
@Configuration
public class JacksonUtilsConfiguration implements BeanFactoryPostProcessor {

    @Override
    public void postProcessBeanFactory(@NotNull ConfigurableListableBeanFactory configurableListableBeanFactory) throws BeansException {
        ObjectMapper bean = configurableListableBeanFactory.getBean(ObjectMapper.class);
        JacksonUtils.setObjectMapper(bean);
    }
}
