# spring-boot-xxljob

> 此 demo 主要演示了 Spring Boot 如何集成 xxl-job

# xxl-job-admin

## application.properties

修改 xxl-job-admin 的 application.properties

```properties
### xxl-job, datasource
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/xxl_job?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai
spring.datasource.username=root
spring.datasource.password=mysql
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

# xxl-job-example

## pom.xml

```xml
<dependency>
    <groupId>com.xuxueli</groupId>
    <artifactId>xxl-job-core</artifactId>
    <version>2.3.1</version>
</dependency>
```

## application.yml

```yaml
xxl:
  job:
    admin:
      addresses: http://localhost:8088/xxl-job-admin/
    executor:
      # 执行器名称
      appname: xxl-job-executor-sample
      address:
      ip: 192.168.31.242
      port: 9999
      logpath: D:\xxl-job-logs\
      logretentiondays: 30
    accessToken: default_token
```

## XxlJobConfig.java

配置类

```java
@Configuration
public class XxlJobConfig {
    private Logger logger = LoggerFactory.getLogger(XxlJobConfig.class);

    @Value("${xxl.job.admin.addresses}")
    private String adminAddresses;

    @Value("${xxl.job.accessToken}")
    private String accessToken;

    @Value("${xxl.job.executor.appname}")
    private String appname;

    @Value("${xxl.job.executor.address}")
    private String address;

    @Value("${xxl.job.executor.ip}")
    private String ip;

    @Value("${xxl.job.executor.port}")
    private int port;

    @Value("${xxl.job.executor.logpath}")
    private String logPath;

    @Value("${xxl.job.executor.logretentiondays}")
    private int logRetentionDays;


    @Bean
    public XxlJobSpringExecutor xxlJobExecutor() {
        logger.info(">>>>>>>>>>> xxl-job config init.");
        XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();
        xxlJobSpringExecutor.setAdminAddresses(adminAddresses);
        xxlJobSpringExecutor.setAppname(appname);
        xxlJobSpringExecutor.setAddress(address);
        xxlJobSpringExecutor.setIp(ip);
        xxlJobSpringExecutor.setPort(port);
        xxlJobSpringExecutor.setAccessToken(accessToken);
        xxlJobSpringExecutor.setLogPath(logPath);
        xxlJobSpringExecutor.setLogRetentionDays(logRetentionDays);

        return xxlJobSpringExecutor;
    }

}
```

## SampleXxlJob.java

XxlJob开发示例（Bean模式）

**开发步骤：**

1. 任务开发：在Spring Bean实例中，开发Job方法；
2. 注解配置：为Job方法添加注解 "@XxlJob(value="自定义jobhandler名称", init = "JobHandler初始化方法", destroy = "
   JobHandler销毁方法")"，注解value值对应的是调度中心新建任务的JobHandler属性的值。
3. 执行日志：需要通过 "XxlJobHelper.log" 打印执行日志；
4. 任务结果：默认任务结果为 "成功" 状态，不需要主动设置；如有诉求，比如设置任务结果为失败，可以通过 "
   XxlJobHelper.handleFail/handleSuccess" 自主设置任务结果；

```java
@Component
public class SampleXxlJob {

    /**
     * 1、简单任务示例（Bean模式）
     */
    @XxlJob("demoJobHandler")
    public void demoJobHandler() throws Exception {
       XxlJobHelper.log("打印日志");
       System.out.println("当前时间：" + LocalDateTime.now());
    }

    /**
     * 2、分片广播任务
     */
    @XxlJob("shardingJobHandler")
    public void shardingJobHandler() throws Exception {
        // 分片序号，从0开始
        int shardIndex = XxlJobHelper.getShardIndex();
        // 分片总数
        int shardTotal = XxlJobHelper.getShardTotal();

        System.out.println("==========shardIndex=" + shardIndex + "=====shardTotal=" + shardTotal + "====================");
    }

}
```

## WebUI

> http://localhost:8088/xxl-job-admin/

- username: admin
- password: 123456