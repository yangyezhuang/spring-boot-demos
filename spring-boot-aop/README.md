# spring-boot-aop

> 此 demo 主要演示了 Spring Boot 如何集成 aop

## pom.xml

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-aspects</artifactId>
</dependency>
```

## LogAspect.java

自定义切面

```java
/**
 * 自定义切面
 */
@Slf4j
@Aspect
@Component
public class LogAspect {

    /**
     * 使用 表达式方式 定义切面
     * 在执行UserService的每个方法前执行:
     */
    @Before("execution(public * com.yyz.aop.service.impl.UserServiceImpl.*(..))")
    public void startLog() {
        log.info("[Before] 使用表达式方式定义切面");
    }


    /**
     * 使用 注解方式 定义切面
     * 在执行MailService的每个方法前后执行:
     */
    @Around(value = "@annotation(com.yyz.aop.aspect.ToSendLog)")
    public Object doLogging(ProceedingJoinPoint pjp) throws Throwable {
        log.info("[Before] 使用注解方式定义切面");
        log.info("[Around] start " + pjp.getSignature());

        Object retVal = pjp.proceed();

        log.info("result：" + retVal); // 打印方法执行返回值
        log.info("[Around] done " + pjp.getSignature());
        return retVal;
    }

}
```

## ToSendLog.java

自定义方法注解

```java
/**
 * 自定义方法注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ToSendLog {
}
```

## AopConfig.java

```java
@Configuration
@EnableAspectJAutoProxy
public class AopConfig {
}
```

## MailServiceImpl.java

```java
/**
 * 用户接口实现类
 */
@Service
public class MailServiceImpl implements IMailService {

    @ToSendLog
    @Override
    public String sendMail(String email) {
        System.out.println("向 " + email + " 发送邮件！");
        return "发送成功";
    }
}
```

### UserServiceImpl.java

```java
/**
 * 用户接口实现类
 */
@Service
public class UserServiceImpl implements IUserService {

    @Override
    public int saveUser() {
        User user1 = new User(1, "tom", "tom@qq.com");
        System.out.println(user1);
        return 0;
    }

}

```

## UserController.java

```java
@RestController
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IMailService mailService;

    @GetMapping("/user")
    public int save() {
        return userService.saveUser();
    }


    @GetMapping("/send/{email}")
    public String sendMail(@PathVariable("email") String email) {
        return mailService.sendMail(email);
    }

}
```
