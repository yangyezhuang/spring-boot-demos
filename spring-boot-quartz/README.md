# spring-boot-quartz

> 此 demo 主要演示了 Spring Boot 如何集成 Quartz

## pom.xml

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-quartz</artifactId>
</dependency>
```

## MyJob.java

定义任务

```java
public class MyJob extends QuartzJobBean {
    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        System.out.println("当前时间：" + LocalDateTime.now());
    }
}
```

## QuartzConfig.java

Quartz配置类，定义任务描述和具体的执行时间

```java
@Configuration
public class QuartzConfig {

    /**
     * 指定任务描述具体的实现类
     *
     * @return
     */
    @Bean
    public JobDetail jobDetail() {
        return JobBuilder.newJob(MyJob.class)
                // 指定任务的名称
                .withIdentity("MyJob")
                // 任务描述
                .withDescription("任务描述：用于输出当前时间")
                // 每次任务执行后进行存储
                .storeDurably()
                .build();
    }


    /**
     * 创建触发器
     *
     * @return
     */
    @Bean
    public Trigger trigger() {
        return TriggerBuilder.newTrigger()
                // 绑定工作任务
                .forJob(jobDetail())
                // 每隔 5 秒执行一次 job
                .withSchedule(SimpleScheduleBuilder.repeatSecondlyForever(5))
                .build();
    }
}
```

