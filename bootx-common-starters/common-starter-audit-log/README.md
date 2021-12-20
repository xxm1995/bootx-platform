# 审计日志模块

## 功能

- 记录登录日志
- 记录各类操作日志
- 数据版本记录，并可以针对不同版本进行对比
- 支持`DB`和`MongoDB`两种存储方式

## 使用说明

### 登录日志

在进行登录操作时，无论成功还是成功，都会记录相关的登录信息，具体信息如下：

```java
@Data
@Accessors(chain = true)
public class LoginLogParam {

    /** 用户账号id */
    private Long userId;
    /** 用户名称 */
    private String account;
    /** 登录成功状态*/
    private Boolean login;
    /** 登录终端 */
    private String client;
    /** 登录IP地址 */
    private String ip;
    /** 登录地点 */
    private String loginLocation;
    /** 浏览器类型 */
    private String browser;
    /** 操作系统 */
    private String os;
    /** 提示消息 */
    private String msg;
    /** 访问时间 */
    private LocalDateTime loginTime;

}
```

### 操作日志

通过对`OperateLog`注解编写对应的操作日志切面，可以对添加`OperateLog`的方法进行拦截并记录操作日志。

使用说明

```java
@OperateLog(title = "重置密码",businessType= BusinessType.UPDATE, saveParam = true)
@PostMapping("/restartPassword")
public ResResult<Void> restartPassword(Long userId,@NotBlank(message = "新密码不能为空") String newPassword){
    userAdminService.restartPassword(userId,newPassword);
    return Res.ok();
}
```

注解参数说明

`audit-log`模块 

- `title`：模块名称
- `businessType`：业务操作类型，默认为OTHER
- `saveParam`：是否保存参数值，默认不保存
- `saverReturn`：是否保存返回结果，默认不保存

业务操作类型

```java
/**
 * 业务操作类型
 */
public enum BusinessType {
    /** 其它 */
    OTHER,
    /** 新增 */
    ADD,
    /** 修改 */
    UPDATE,
    /** 删除 */
    DELETE,
    /** 授权 */
    GRANT,
    /** 导出 */
    EXPORT,
    /** 导入 */
    IMPORT,
    /** 强退 */
    FORCE,
    /** 清空数据 */
    CLEAN,
}

```

保存信息内容

```java
@Data
@Accessors(chain = true)
public class OperateLogParam {
    /** 操作模块 */
    private String title;
    /** 操作人员id */
    private Long operateId;
    /** 操作人员账号 */
    private String username;
    /** 业务类型 */
    private String businessType;
    /** 请求方法 */
    private String method;
    /** 请求方式 */
    private String requestMethod;
    /** 请求url */
    private String operateUrl;
    /** 操作ip */
    private String operateIp;
    /** 操作地点 */
    private String operateLocation;
    /** 请求参数 */
    private String operateParam;
    /** 返回参数 */
    private String operateReturn;
    /** 操作状态（0正常 1异常） */
    private Boolean success;
    /** 错误消息 */
    private String errorMsg;
    /** 操作时间 */
    private LocalDateTime operateTime;

}
```

### 数据版本记录

TODO 开发中

### 参数配置

```yaml
bootx:
  starter:
    audit-log:
      # 存储方式 jdbc/Mongo
      store: mongo
```

### 关键类

- `OperateLogAspectHandler` 操作日志切面处理类
- `LoginLogService` 登陆日志处理接口
- `OperateLogService` 操作日志处理接口
- `LoginLogParam` 要保存的登录日志信息
- `OperateLogParam` 要保存的操作日志信息

### 扩展新的存储方式

1. 继承`LoginLogService`/`OperateLogService` 接口，实现对应方法，并设置该实现类Bean的生效方式

   ```java
   @Slf4j
   @Service
   @ConditionalOnProperty(
       prefix = "bootx.starter.audit-log", 
       value = "store", 
       // 设置自己的存储方式名称
       havingValue = "Es",
       matchIfMissing = true)
   @RequiredArgsConstructor
   public class OperateLogEsService implements Operatee {
   }
   ```

2. 通常要编写 `LoginLogParam`/ `OperateLogParam`对应的数据库持久化类，同时提供持久化类转换为  `LoginLogDto`/ `OperateLogDto`的方式，`*LogServic`接口中有几个方法返回值就是上面两个Dto对象

3. 在配置文件中配置存储方式

   ```yaml
   bootx:
     starter:
       audit-log:
         # 填写自己扩展的存储方式
         store: mongo
   ```

   

## 前端管理模块
