package cn.bootx.common.swagger;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanDefinitionRegistryPostProcessor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.boot.context.properties.bind.Binder;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import javax.validation.constraints.NotNull;

/**
 * swagger 自动配置
 * @author xxm
 * @date 2020/4/9 13:33
 */
@Slf4j
@Configuration
@EnableConfigurationProperties(SwaggerProperties.class)
@RequiredArgsConstructor
public class SwaggerAutoConfiguration implements BeanDefinitionRegistryPostProcessor, EnvironmentAware {
	private final String swaggerPropertiesPrefix = "bootx.common.swagger";

    private SwaggerProperties swaggerProperties;

	public GroupedOpenApi createApi(String key, String basePackage) {
        return GroupedOpenApi.builder()
                .group(key)
                .packagesToScan(basePackage)
                .build();
	}

    @Bean
    public GroupedOpenApi iamApi(){
        return this.createApi("认证","cn.bootx.iam");
    }


    @Bean
    public GroupedOpenApi baseApiApi(){
        return this.createApi("基础接口","cn.bootx.baseapi");
    }

    @Bean
    public OpenAPI springShopOpenAPI() {
        return new OpenAPI()
                .info(new Info().title(swaggerProperties.getTitle())
                        .description(swaggerProperties.getDescription())
                        .version(swaggerProperties.getVersion())
                        .license(new License().name("Apache 2.0").url("https://www.apache.org/licenses/LICENSE-2.0")))
                .externalDocs(new ExternalDocumentation()
                        .description(swaggerProperties.getDescription())
                        .url(swaggerProperties.getTermsOfServiceUrl()));
    }

    /**
     * 手动注册swagger docket bean
     */
    @Override
    public void postProcessBeanDefinitionRegistry(@NotNull BeanDefinitionRegistry registry) throws BeansException {
//        Map<String, String> basePackages = this.swaggerProperties.getBasePackages();
//        basePackages.forEach((key, value) ->{
//            RootBeanDefinition bean = new RootBeanDefinition(GroupedOpenApi.class,()->this.createApi(key,value));
//            registry.registerBeanDefinition(key, bean);
//        } );
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
