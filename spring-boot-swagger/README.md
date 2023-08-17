# spring-boot-swagger

> 此 demo 主要演示了 Spring Boot 如何集成原生 swagger ，自动生成 API 文档。
>
> 启动项目，访问：http://localhost:8080/swagger-ui.html

# pom.xml

```xml
<dependencies>
    <dependency>
        <groupId>io.springfox</groupId>
        <artifactId>springfox-swagger2</artifactId>
        <version>2.7.0</version>
    </dependency>

    <dependency>
        <groupId>io.springfox</groupId>
        <artifactId>springfox-swagger-ui</artifactId>
        <version>2.7.0</version>
    </dependency>
</dependencies>
```

## SwaggerConfig.java

```java
/**
 * Swagger配置文件
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket docket() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .groupName("WebApi")
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.yyz.swagger.controller"))
                // 过滤请求路径, PathSelectors.ant("/user/**")
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Swagger学习项目-API文档")
                .description("Api接口定义")
                .version("1.0")
                .contact(new Contact("Yang Yezhuang", "https://github.com/yangyezhuang", "123456@qq.com"))
                .build();
    }

}
```

## UserController.java

> 主要演示API层的注解。

```java
/**
 * User控制层
 */
@Api(value = "用户接口管理", tags = "用户接口管理")
@RestController
@RequestMapping("/user")
public class UserController {

    @ApiOperation("获取用户信息")
    @GetMapping("/{id}")
    public String getUser(@PathVariable("id") int id) {
        return "获取用户" + id + "成功";
    }

    
    @ApiOperation("新增用户信息")
    @PostMapping()
    public String saveUser() {
        return "新增成功";
    }

    
    @ApiOperation("修改用户信息")
    @PutMapping("/{id}")
    public String updateUser(@PathVariable("id") int id) {
        return "修改" + id + "成功";
    }

    
    @ApiOperation("删除用户信息")
    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        return "删除" + id + "成功";
    }

}
```

## application.yml
```yaml
spring:
  mvc:
    pathmatch:
      matching-strategy: ant-path-matcher
```

## 参考

1. swagger 官方网站：https://swagger.io/

2. swagger 官方文档：https://github.com/swagger-api/swagger-core/wiki/Swagger-2.X---Getting-started

3. swagger 常用注解：https://github.com/swagger-api/swagger-core/wiki/Swagger-2.X---Annotations