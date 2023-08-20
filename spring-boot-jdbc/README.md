# spring-boot-mybatis

> 此 demo 主要演示了 Spring Boot 如何集成 jdbc 。

## pom.xml

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jdbc</artifactId>
    </dependency>

    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.30</version>
    </dependency>

    <dependency>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <optional>true</optional>
    </dependency>
</dependencies>
```

## User.java
```java
/**
 * 用户实体类
 */
@Data
@Entity                 //标识这是一个实体类
@Table(name = "user")   //标识与之映射的表名
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class User {
    /**
     * 主键生成策略：自增
     */
    @Id //识数据库主键
    @GeneratedValue(strategy = GenerationType.IDENTITY) //标识主键生成策略，这里是自增。
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
```

## UserDao.java

```java
/**
 * 用户接口
 */
@Repository
public interface UserDao extends JpaRepository<User, Integer> {

    /**
     * 自定义查询方式
     *
     * @param username
     * @return
     */
    @Query("select u from User u where u.username = ?1")
    User getByUsername(String username);

}
```

## UserService.java
```java
/**
 * 用户接口
 */
public interface UserService {
    List<User> queryAll();

    User queryById(int id);

    User getByUsername(String username);

    User saveUser(User user);

    User updateById(User user);

    void deleteById(int id);

}
```
## UserServiceImpl.java
```java
/**
 * 用户接口实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll() {
        return userDao.findAll();
    }

    @Override
    public User queryById(int id) {
        return userDao.getById(id);
    }

    @Override
    public User getByUsername(String username) {
        return userDao.getByUsername(username);
    }

    @Override
    public User saveUser(User user) {
        return userDao.save(user);
    }

    @Override
    public User updateById(User user) {
        int userId = user.getId();
        User oldUser = userDao.findById(userId).get();
        BeanUtils.copyProperties(user, oldUser);
        return userDao.save(oldUser);
    }

    @Override
    public void deleteById(int id) {
        userDao.deleteById(id);
    }

}
```


## UserController.java

> 主要演示API层的注解。

```java
/**
 * 用户控制层
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户信息
     *
     * @return
     */
    @GetMapping("/list")
    public List<User> getUserList() {
        return userService.queryAll();
    }


    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public User queryById(@PathVariable("id") int id) {
        return userService.queryById(id);
    }


    /**
     * 根据用户名查询
     *
     * @param username
     * @return
     */
    @GetMapping("/username/{username}")
    public User queryById(@PathVariable("username") String username) {
        return userService.getByUsername(username);
    }


    /**
     * 添加用户信息
     *
     * @param user
     * @return
     */
    @PostMapping()
    public User saveUser(@RequestBody User user) {
        return userService.saveUser(user);
    }


    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @PutMapping()
    public User updateById(@RequestBody User user) {
        return userService.updateById(user);
    }


    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable("id") int id) {
        userService.deleteById(id);
        return "删除成功";
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
    
  jpa:
    database: mysql
    database-platform: org.hibernate.dialect.MySQL5Dialect
    show-sql: true # 在日志里显示执行的sql语句
    hibernate:
      ddl-auto: update #指定为update，每次启动项目检测表结构有变化的时候会新增字段，表不存在时会 新建，如果指定create，则每次启动项目都会清空数据并删除表，再新建
      naming:
        # 指定jpa的自动表生成策略，驼峰自动映射为下划线格式7
        implicit-strategy: org.hibernate.boot.model.naming.ImplicitNamingStrategyLegacyJpaImpl
```
