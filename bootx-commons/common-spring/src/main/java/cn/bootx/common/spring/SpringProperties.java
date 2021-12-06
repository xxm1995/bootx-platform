package cn.bootx.common.spring;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
* @author xxm
* @date 2020/4/9 13:50
*/
@ConfigurationProperties(prefix = "bootx.common.spring")
@Data
@Accessors(chain = true)
public class SpringProperties {

    /** 开启cors跨域处理 */
    private boolean cors = true;

    /** 线程池配置 */
    private Executor executor = new Executor();

	/**
	* @author xxm
	* @date 2021/6/11
	*/
	@Data
	@Accessors(chain = true)
	public static class Executor {
        /**
         * 线程池维护线程的最少数量
         */
        private int corePoolSize = 10;

        /**
         * 线程池维护线程的最大数量
         */
        private int maxPoolSize = 50;

        /**
         * 缓存队列容量
         */
        private int queueCapacity = 5000;

        /**
         * 保持活动秒数
         */
        private int keepAliveSeconds = 60;
    }
}
