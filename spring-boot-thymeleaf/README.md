# spring-boot-thymeleaf

> 此 demo 主要演示了 Spring Boot 如何集成 thymeleaf

## pom.xml

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

## application.yml

```yaml
spring:
  thymeleaf:
    cache: false
    prefix: classpath:/templates/
    encoding: UTF-8
    suffix: .html
```

## UserController.java

```java
/**
 * 控制层
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public ModelAndView index() {
        ArrayList<UserModel> users = getUser();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("title", "这是标题");
        modelAndView.addObject("users", users);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @GetMapping("/test")
    public String index(Model model) {
        model.addAttribute("test", "这是测试数据");
        return "index";
    }

    // 生成测试数据
    public ArrayList<UserModel> getUser() {
        ArrayList<UserModel> userList = new ArrayList<>();
        for (int i = 1; i < 6; i++) {
            UserModel user = new UserModel();
            user.setId(i);
            user.setName("name" + i);
            user.setAge(20 + i);
            userList.add(user);
        }
        return userList;
    }
}
```

## index.html

```html
<!DOCTYPE html>
<html lang="en" xmlns:th="https://www.thymeleaf.org/">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h2 th:text="${title}"></h2>
    <table border="1">
        <tr>
            <td>ID</td>
            <td>姓名</td>
            <td>年龄</td>
        </tr>
        <tr th:each="user:${users}">
            <td th:text="${user.id}"></td>
            <td th:text="${user.name}"></td>
            <td th:text="${user.age}"></td>
        </tr>
    </table>
</body>
</html>
```