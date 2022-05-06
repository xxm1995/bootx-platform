package cn.bootx.common.lock.configurer;

import cn.bootx.common.lock.constant.LockConstant;
import cn.bootx.common.lock.constant.ServerPattern;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 锁配置属性类
 *
 * @author xianzhi.chen@hand-china.com 2019年1月14日下午5:12:30
 */
@Getter
@Setter
@ConfigurationProperties(prefix = "bootx.common.lock")
public class LockConfigProperties {

    /**
     * Redis的运行模式,默认使用单机模式
     */
    private String pattern = ServerPattern.SINGLE.getPattern();
    /**
     * 单节点模式
     */
    private SingleConfig singleServer;
    /**
     * 集群模式
     */
    private ClusterConfig clusterServer;
    /**
     * 云托管模式
     */
    private ReplicatedConfig replicatedServer;
    /**
     * 哨兵模式
     */
    private SentinelConfig sentinelServer;
    /**
     * 主从模式
     */
    private MasterSlaveConfig masterSlaveServer;
    /**
     * 客户端名称
     */
    private String clientName = LockConstant.LOCK_CLIENT_NAME;
    /**
     * 启用SSL终端识别
     */
    private boolean sslEnableEndpointIdentification = false;
    /**
     * SSL实现方式，确定采用哪种方式（JDK或OPENSSL）来实现SSL连接
     */
    private String sslProvider = LockConstant.JDK;
    /**
     * SSL信任证书库路径
     */
    private String sslTruststore;
    /**
     * SSL信任证书库密码
     */
    private String sslTruststorePassword;
    /**
     * SSL钥匙库路径
     */
    private String sslKeystore;
    /**
     * SSL钥匙库密码
     */
    private String sslKeystorePassword;
    /**
     * RTopic共享线程数量
     */
    private int threads = 0;
    /**
     * Redisson使用的所有redis客户端之间共享的线程数量
     */
    private int nettyThreads = 0;
    /**
     * 仅在没有leaseTimeout参数定义的情况下获取锁定时才使用此参数。看门狗过期时间
     */
    private long lockWatchdogTimeout = 30000;
    /**
     * 是否串行处理消息
     */
    private boolean keepPubSubOrder = true;
    /**
     * 否在Redis端使用Lua脚本缓存
     */
    private boolean useScriptCache = false;

    /**
     * 主从模式
     *
     * @author xianzhi.chen@hand-china.com 2019年4月4日下午2:26:31
     */
    @Getter
    @Setter
    public static class MasterSlaveConfig {
        /**
         * DNS监控间隔，单位:毫秒
         */
        private long dnsMonitoringInterval = 5000;
        /**
         * 主节点地址，可以通过host:port的格式来指定主节点地址。
         */
        private String masterAddress;
        /**
         * 从节点地址
         */
        private String slaveAddresses;
        /**
         * 读取操作的负载均衡模式
         */
        private String readMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 订阅操作的负载均衡模式
         */
        private String subMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 负载均衡算法类的选择，默认：轮询调度算法
         */
        private String loadBalancer = LockConstant.LoadBalancer.ROUND_ROBIN_LOAD_BALANCER;
        /**
         * 默认权重值，当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private int defaultWeight = 0;
        /**
         * 权重值设置，格式为 host1:port1,权重值1;host2:port2,权重值2 当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private String weightMaps;
        /**
         * 从节点发布和订阅连接的最小空闲连接数
         */
        private int subscriptionConnectionMinimumIdleSize = 1;
        /**
         * 从节点发布和订阅连接池大小
         */
        private int subscriptionConnectionPoolSize = 50;
        /**
         * 从节点最小空闲连接数
         */
        private int slaveConnectionMinimumIdleSize = 32;
        /**
         * 从节点连接池大小
         */
        private int slaveConnectionPoolSize = 64;
        /**
         * 主节点最小空闲连接数
         */
        private int masterConnectionMinimumIdleSize = 32;
        /**
         * 主节点连接池大小
         */
        private int masterConnectionPoolSize = 64;
        /**
         * 连接空闲超时，单位：毫秒
         */
        private int idleConnectionTimeout = 10000;
        /**
         * 连接超时，单位：毫秒
         */
        private int connectTimeout = 10000;
        /**
         * 命令等待超时，单位：毫秒
         */
        private int timeout = 3000;
        /**
         * 命令失败重试次数
         */
        private int retryAttempts = 3;
        /**
         * 命令重试发送时间间隔，单位：毫秒
         */
        private int retryInterval = 1500;
        /**
         * 重新连接时间间隔，单位：毫秒
         */
        private int reconnectionTimeout = 3000;
        /**
         * 执行失败最大次数
         */
        private int failedAttempts = 3;
        /**
         * 数据库编号
         */
        private int database = 0;
        /**
         * 密码，用于节点身份验证的密码
         */
        private String password;
        /**
         * 单个连接最大订阅数量
         */
        private int subscriptionsPerConnection = 5;

    }

    @Getter
    @Setter
    public static class SentinelConfig {
        /**
         * DNS监控间隔，单位：毫秒；用-1来禁用该功能。
         */
        private long dnsMonitoringInterval = 5000;
        /**
         * 主服务器的名称
         */
        private String masterName;
        /**
         * 哨兵节点地址，多个节点可以一次性批量添加。
         */
        private String sentinelAddresses;
        /**
         * 读取操作的负载均衡模式
         */
        private String readMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 订阅操作的负载均衡模式
         */
        private String subMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 负载均衡算法类的选择，默认：轮询调度算法
         */
        private String loadBalancer = LockConstant.LoadBalancer.ROUND_ROBIN_LOAD_BALANCER;
        /**
         * 默认权重值，当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private int defaultWeight = 0;
        /**
         * 权重值设置，格式为 host1:port1,权重值1;host2:port2,权重值2 当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private String weightMaps;
        /**
         * 从节点发布和订阅连接的最小空闲连接数
         */
        private int subscriptionConnectionMinimumIdleSize = 1;
        /**
         * 从节点发布和订阅连接池大小
         */
        private int subscriptionConnectionPoolSize = 50;
        /**
         * 从节点最小空闲连接数
         */
        private int slaveConnectionMinimumIdleSize = 32;
        /**
         * 从节点连接池大小
         */
        private int slaveConnectionPoolSize = 64;
        /**
         * 主节点最小空闲连接数
         */
        private int masterConnectionMinimumIdleSize = 32;
        /**
         * 主节点连接池大小
         */
        private int masterConnectionPoolSize = 64;
        /**
         * 连接空闲超时，单位：毫秒
         */
        private int idleConnectionTimeout = 10000;
        /**
         * 连接超时，单位：毫秒
         */
        private int connectTimeout = 10000;
        /**
         * 命令等待超时，单位：毫秒
         */
        private int timeout = 3000;
        /**
         * 命令失败重试次数
         */
        private int retryAttempts = 3;
        /**
         * 命令重试发送时间间隔，单位：毫秒
         */
        private int retryInterval = 1500;
        /**
         * 数据库编号
         */
        private int database = 0;
        /**
         * 密码，用于节点身份验证的密码
         */
        private String password;
        /**
         * 单个连接最大订阅数量
         */
        private int subscriptionsPerConnection = 5;

    }

    @Getter
    @Setter
    public static class ReplicatedConfig {
        /**
         * 集群节点地址
         */
        private String nodeAddresses;
        /**
         * 主节点变化扫描间隔时间
         */
        private int scanInterval = 1000;
        /**
         * DNS监控间隔，单位：毫秒；用-1来禁用该功能。
         */
        private long dnsMonitoringInterval = 5000;
        /**
         * 读取操作的负载均衡模式
         */
        private String readMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 订阅操作的负载均衡模式
         */
        private String subscriptionMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 负载均衡算法类的选择，默认：轮询调度算法
         */
        private String loadBalancer = LockConstant.LoadBalancer.ROUND_ROBIN_LOAD_BALANCER;
        /**
         * 默认权重值，当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private int defaultWeight = 0;
        /**
         * 权重值设置，格式为 host1:port1,权重值1;host2:port2,权重值2 当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private String weightMaps;
        /**
         * 从节点发布和订阅连接的最小空闲连接数
         */
        private int subscriptionConnectionMinimumIdleSize = 1;
        /**
         * 从节点发布和订阅连接池大小
         */
        private int subscriptionConnectionPoolSize = 50;
        /**
         * 从节点最小空闲连接数
         */
        private int slaveConnectionMinimumIdleSize = 32;
        /**
         * 从节点连接池大小
         */
        private int slaveConnectionPoolSize = 64;
        /**
         * 主节点最小空闲连接数
         */
        private int masterConnectionMinimumIdleSize = 32;
        /**
         * 主节点连接池大小
         */
        private int masterConnectionPoolSize = 64;
        /**
         * 连接空闲超时，单位：毫秒
         */
        private int idleConnectionTimeout = 10000;
        /**
         * 连接超时，单位：毫秒
         */
        private int connectTimeout = 10000;
        /**
         * 命令等待超时，单位：毫秒
         */
        private int timeout = 3000;
        /**
         * 命令失败重试次数
         */
        private int retryAttempts = 3;
        /**
         * 命令重试发送时间间隔，单位：毫秒
         */
        private int retryInterval = 1500;
        /**
         * 数据库编号
         */
        private int database = 0;
        /**
         * 密码，用于节点身份验证的密码
         */
        private String password;
        /**
         * 单个连接最大订阅数量
         */
        private int subscriptionsPerConnection = 5;

    }

    @Getter
    @Setter
    public static class ClusterConfig {
        /**
         * 集群节点地址
         */
        private String nodeAddresses;
        /**
         * 集群扫描间隔时间
         */
        private int scanInterval = 1000;
        /**
         * 读取操作的负载均衡模式
         */
        private String readMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 订阅操作的负载均衡模式
         */
        private String subMode = LockConstant.SubReadMode.SLAVE;
        /**
         * 负载均衡算法类的选择，默认：轮询调度算法
         */
        private String loadBalancer = LockConstant.LoadBalancer.ROUND_ROBIN_LOAD_BALANCER;
        /**
         * 默认权重值，当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private int defaultWeight = 0;
        /**
         * 权重值设置，格式为 host1:port1,权重值1;host2:port2,权重值2 当负载均衡算法是权重轮询调度算法时该属性有效
         */
        private String weightMaps;
        /**
         * 从节点发布和订阅连接的最小空闲连接数
         */
        private int subConnMinIdleSize = 1;
        /**
         * 从节点发布和订阅连接池大小
         */
        private int subConnPoolSize = 50;
        /**
         * 从节点最小空闲连接数
         */
        private int slaveConnMinIdleSize = 32;
        /**
         * 从节点连接池大小
         */
        private int slaveConnPoolSize = 64;
        /**
         * 主节点最小空闲连接数
         */
        private int masterConnMinIdleSize = 32;
        /**
         * 主节点连接池大小
         */
        private int masterConnPoolSize = 64;
        /**
         * 连接空闲超时，单位：毫秒
         */
        private int idleConnTimeout = 10000;
        /**
         * 连接超时，单位：毫秒
         */
        private int connTimeout = 10000;
        /**
         * 命令等待超时，单位：毫秒
         */
        private int timeout = 3000;
        /**
         * 命令失败重试次数
         */
        private int retryAttempts = 3;
        /**
         * 命令重试发送时间间隔，单位：毫秒
         */
        private int retryInterval = 1500;
        /**
         * 密码
         */
        private String password;
        /**
         * 单个连接最大订阅数量
         */
        private int subPerConn = 5;

    }

    @Getter
    @Setter
    public static class SingleConfig {
        /**
         * 节点地址
         */
        private String address;
        /**
         * 节点端口
         */
        private int port = 6379;
        /**
         * 发布和订阅连接的最小空闲连接数
         */
        private int subConnMinIdleSize = 1;
        /**
         * 发布和订阅连接池大小
         */
        private int subConnPoolSize = 50;
        /**
         * 最小空闲连接数
         */
        private int connMinIdleSize = 32;
        /**
         * 连接池大小
         */
        private int connPoolSize = 64;
        /**
         * 是否启用DNS监测
         */
        private boolean dnsMonitoring = false;
        /**
         * DNS监测时间间隔，单位：毫秒，该配置需要dnsMonitoring设为true
         */
        private int dnsMonitoringInterval = 5000;
        /**
         * 连接空闲超时，单位：毫秒
         */
        private int idleConnTimeout = 10000;
        /**
         *
         */
        private boolean keepAlive = false;
        /**
         * 连接超时，单位：毫秒
         */
        private int connTimeout = 10000;
        /**
         * 命令等待超时，单位：毫秒
         */
        private int timeout = 3000;
        /**
         * 命令失败重试次数 如果尝试达到 retryAttempts（命令失败重试次数） 仍然不能将命令发送至某个指定的节点时，将抛出错误。如果尝试在此限制之内发送成功，则开始启用
         * timeout（命令等待超时） 计时。
         */
        private int retryAttempts = 3;
        /**
         * 命令重试发送时间间隔，单位：毫秒
         */
        private int retryInterval = 1500;
        /**
         * 数据库编号
         */
        private int database = 0;
        /**
         * 密码
         */
        private String password;
        /**
         * 单个连接最大订阅数量
         */
        private int subPerConn = 5;
    }
}
