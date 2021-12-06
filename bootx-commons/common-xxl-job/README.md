## XXL-JOB定时任务

### 功能
`XXL-Job`定时任务，项目需要可以被`xxl-job`服务器联通，因为执行操作需要`xxl-job server`下发，目前项目作为单体型，默认使用`quartz`定时任务方式，同时也提供`XXL-Job`作为备选

### 使用
引入该模块后配置文件会有会有注释和自动提示，具体配置项可以查看注释或`XXL-JOB` 官网文档，具体使用方法也请查阅`XXL-JOB` 官网文档
 [XXL-JOB官网](https://www.xuxueli.com/xxl-job/)

```yaml
bootx:
  common:
    xxl-job:
      adminAddresses: 
      address: 
      access-token: 
      appname: 
      ip: 
      log-path: 
      log-retention-days: 
      port: 
```