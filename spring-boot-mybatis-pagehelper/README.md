# spring-boot-mybatis-pagehelper

> 此 demo 主要演示了 Spring Boot 如何集成 PageHelper

## pom.xml

```xml
<dependencies>
    <dependency>
        <groupId>org.mybatis.spring.boot</groupId>
        <artifactId>mybatis-spring-boot-starter</artifactId>
        <version>2.3.0</version>
    </dependency>

    <dependency>
        <groupId>com.github.pagehelper</groupId>
        <artifactId>pagehelper-spring-boot-starter</artifactId>
        <version>1.4.6</version>
    </dependency>
</dependencies>
```

## User.java

用户实体类

```java
@Data
public class User {
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
```

## UserDao.java

用户DAO接口

```java
@Mapper
public interface UserDao {
    /**
     * 查询全部
     */
    @Select("select * from user")
    List<User> queryAll();

    /**
     * 根据性别查询
     */
    @Select("select * from user where sex=#{sex}")
    List<User> queryBySex(String sex);
}
```

## UserService.java

用户接口

```java
public interface UserService {
    List<User> queryAll(int pageNum, int pageSize);

    PageInfo<User> queryBySex(String sex, int pageNum, int pageSize);
}
```

## UserServiceImpl.java

用户接口实现类

```java
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return userDao.queryAll();
    }

    @Override
    public PageInfo<User> queryBySex(String sex, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> users = userDao.queryBySex(sex);
        PageInfo<User> page = new PageInfo<>(users, pageSize);
        return page;
    }
}
```

## UserController.java

用户控制层

```java
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户
     *
     * @return
     */
    @GetMapping("/list/{pageNum}/{pageSize}")
    public List<User> getUserList(@PathVariable("pageNum") int pageNum,
                                  @PathVariable("pageSize") int pageSize) {
        return userService.queryAll(pageNum, pageSize);
    }


    /**
     * 根据性别查询
     *
     * @param sex
     * @return
     */
    @GetMapping("/list/{sex}/{pageNum}/{pageSize}")
    public PageInfo<User> queryBySex(@PathVariable("sex") String sex,
                                     @PathVariable("pageNum") int pageNum,
                                     @PathVariable("pageSize") int pageSize) {
        return userService.queryBySex(sex, pageNum, pageSize);
    }
}
```

## application.yml

```yaml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/test_db?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
    username: root
    password: mysql
```
