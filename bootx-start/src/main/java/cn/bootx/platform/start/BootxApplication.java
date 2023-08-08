package cn.bootx.platform.start;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 启动类
 *
 * @author xxm
 * @since 2021/7/27
 */
@Slf4j
@SpringBootApplication
public class BootxApplication {

    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext application = SpringApplication.run(BootxApplication.class, args);
        Environment env = application.getEnvironment();
        // 环境变量
        String appName = env.getProperty("spring.application.name");
        String host = InetAddress.getLocalHost().getHostAddress();
        String port = env.getProperty("server.port");
        String contextPath = env.getProperty("server.servlet.context-path", "");
        String path = env.getProperty("spring.mvc.servlet.path", "");

        // 应用信息栏
        String appInfo = StrUtil.format("应用 '{}' 运行成功! \n\t", appName);
        // swagger栏
        String swagger = StrUtil.format("Swagger文档: \t\thttp://{}:{}{}{}/doc.html\n\t", host, port, contextPath, path);

        log.info("\n----------------------------------------------------------\n\t" + "{}{} \n"
                + "----------------------------------------------------------", appInfo, swagger);
    }

}
