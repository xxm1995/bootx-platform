
## 请求头工具

### 说明

​	获取请求头中的数据，并可以在**异步与多线程**代码中获取。通过创建一个web过滤器，每次请求到来时，获取请求头的所有请求头数据存储到TTL容器（`TransmittableThreadLocal`）里，存储到TTL容器是为了在异步或者多线程代码中不丢失请求头数据，请求结束后自动清除数据。

### 对应类

- `HeaderHolder`  请求头获取工具类，用于调用获取请求头信息
- `HolderContextHolder` 请求头上下文`TTL`存储类
- `WebHeaderHolderInterceptor` web请求头过滤器
