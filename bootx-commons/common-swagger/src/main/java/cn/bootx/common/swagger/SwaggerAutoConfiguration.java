package cn.bootx.common.swagger;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanDefinitionRegistryPostProcessor;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.boot.context.properties.bind.Binder;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.env.Environment;
import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.validation.constraints.NotNull;
import java.util.Map;

/**
 * swagger 自动配置
 * @author xxm
 * @date 2020/4/9 13:33
 */
@Slf4j
@Configuration
@EnableSwagger2
@EnableConfigurationProperties(SwaggerProperties.class)
@ConditionalOnClass(EnableSwagger2.class)
@AutoConfigureAfter(BeanValidatorPluginsConfiguration.class)
@Import(BeanValidatorPluginsConfiguration.class)
@RequiredArgsConstructor
public class SwaggerAutoConfiguration implements BeanDefinitionRegistryPostProcessor, EnvironmentAware {
	private final String swaggerPropertiesPrefix = "bootx.common.swagger";

    private SwaggerProperties swaggerProperties;

	public Docket createApi(String key, String basePackage) {
        return new Docket(DocumentationType.SWAGGER_2)
                .useDefaultResponseMessages(false)
                .apiInfo(apiInfo())
                .groupName(key)
                .select()
                .apis(RequestHandlerSelectors.basePackage(basePackage))
                .paths(PathSelectors.any()).build();
	}


	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
				.title(swaggerProperties.getTitle())
				.description(swaggerProperties.getDescription())
				.termsOfServiceUrl(swaggerProperties.getTermsOfServiceUrl())
				.version(swaggerProperties.getVersion())
				.build();
	}

    /**
     * 手动注册swagger docket bean
     */
    @Override
    public void postProcessBeanDefinitionRegistry(@NotNull BeanDefinitionRegistry registry) throws BeansException {
        Map<String, String> basePackages = this.swaggerProperties.getBasePackages();
        basePackages.forEach((key, value) ->{
            RootBeanDefinition bean = new RootBeanDefinition(Docket.class,()->this.createApi(key,value));
            registry.registerBeanDefinition(key, bean);
        } );
    }

    @Override
    public void postProcessBeanFactory(@NotNull ConfigurableListableBeanFactory beanFactory) throws BeansException {

    }

    /**
     * 获取环境变量并设置到swaggerProperties对象中
     */
    @Override
    public void setEnvironment(@NotNull Environment environment) {
        BindResult<SwaggerProperties> bind = Binder.get(environment)
                .bind(swaggerPropertiesPrefix, SwaggerProperties.class);
        this.swaggerProperties = bind.get();
    }
}
