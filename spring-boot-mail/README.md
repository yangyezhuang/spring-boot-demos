# spring-boot-mail

> 此 demo 主要演示了 Spring Boot 如何集成 mail 发送邮件。

# pom.xml

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-mail</artifactId>
</dependency>
```

## MailController.java

```java
@RestController
public class MailController {

    @Autowired
    MailService mailService;

    @PostMapping("/send/{email}")
    public String sendMail(@PathVariable("email") String email) {
        boolean result = mailService.sendMail(email);
        if (result) {
            return "发送成功";
        }
        return "发送失败";
    }

}
```

## MailServiceImpl.java

```java
@Slf4j
@Service
public class MailServiceImpl implements MailService {
    @Autowired
    JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String from;

    /**
     * 发送验证码
     */
    @Override
    public boolean sendMail(String email) {
        try {
            // 生成验证码
            int verifyCode = (int) ((Math.random() * 9 + 1) * 100000);
            log.info("验证码：" + verifyCode);
            // 构造邮件
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setSubject("在线测试平台注册");
            mailMessage.setText("您的注册验证码是：" + verifyCode);
            mailMessage.setTo(email);
            mailMessage.setFrom(from);
            javaMailSender.send(mailMessage);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
```

## application.yml

```yaml
spring:
  mail:
    host: smtp.qq.com
    protocol: smtp
    username: test@test.com
    password: xxxxxxxxx
    default-encoding: utf-8
    properties:
      mail:
        smtp:
          ssl:
            enable: true
```
