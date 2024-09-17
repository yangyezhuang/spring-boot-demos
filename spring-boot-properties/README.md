# spring-boot-mybatis

> 此 demo 主要演示了 Spring Boot 如何读取 properties 配置文件

## application.yml

```yaml
user:
  username: tom
  age: 22
  sex: male
```

## UserController.java

```java
/**
 * 读取配置文件
 */
@RestController
public class UserContrroller {

    @Value("${user.username}")
    private String name;

    @Value("${user.sex}")
    private String sex;

    @Value("${user.age}")
    private int age;

    @GetMapping("/user")
    public String getUser() {
        return "用户名: " + name + "，性别: " + sex + "，年龄: " + age;
    }
}
```