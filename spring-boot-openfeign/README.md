# spring-boot-openfeign

> 此 demo 主要演示了 Spring Boot 如何集成 OpenFeign

## 服务端

## ServerController.java

```java
@RestController
@RequestMapping("/demo")
public class ServerController {

    @GetMapping("/test")
    public String test() {
        return "This is client";
    }
}
```

## application.yml

```yaml
server:
  port: 8081
```

## 客户端

## pom.xml

```xml
<dependency>
  <groupId>org.springframework.cloud</groupId>
  <artifactId>spring-cloud-starter-openfeign</artifactId>
  <version>3.1.8</version>
</dependency>
```

## ClientController.java

```java
@RestController
@RequestMapping("feign")
public class ClientController {
    @Autowired
    FeignDemo feignDemo;

    @GetMapping("test")
    public String test() {
        return feignDemo.test();
    }
}
```

## FeignDemo.java

```java
@FeignClient(name = "demo", url = "http://localhost:8081/demo", fallback = ErrorMessage.class)
public interface FeignDemo {

    @GetMapping("/test")
    String test();

}
```

## ErrorMessage.java

熔断降级

```java
@Component
public class ErrorMessage implements FeignDemo {
    @Override
    public String test() {
        return "服务器开小差了，请稍后再试";
    }
}
```

## application.yml

```yaml
server:
  port: 8080

feign:
  hystrix:
    enabled: true
```
