# spring-boot-mybatis-plus

> 此 demo 主要演示了 Spring Boot 如何集成 mybatis-plus

## pom.xml

```xml
<dependency>
    <groupId>org.mybatis.spring.boot</groupId>
    <artifactId>mybatis-plus-boot-starter</artifactId>
    <version>2.3.0</version>
</dependency>
```

## User.java

```java
@Data
public class User {
    private Integer id;
    private String username;
    private String password;
    private String sex;
    private Integer age;
}
```

## UserDao.java

```java
/**
 * 用户接口
 */
@Mapper
public interface UserDao extends BaseMapper<User> {
}
```

## UserService.java

```java
/**
 * 用户接口
 */
public interface UserService {
    /**
     * 查询全部用户信息
     */
    List<User> queryAll();

    /**
     * 根据id查询用户
     */
    User queryById(int id);

    /**
     * 根据username 查询
     */
    User queryByUsername(String username);

    /**
     * 添加用户信息
     */
    int saveUser(User user);

    /**
     * 修改用户信息
     */
    int updateById(User user);

    /**
     * 根据id删除用户
     */
    int deleteById(int id);
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
        return userDao.selectList(null);
    }

    @Override
    public User queryById(int id) {
        return userDao.selectById(id);
    }

    @Override
    public User queryByUsername(String username) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        return userDao.selectOne(wrapper);
    }

    @Override
    public int saveUser(User user) {
        return userDao.insert(user);
    }

    @Override
    public int updateById(User user) {
        return userDao.updateById(user);
    }

    @Override
    public int deleteById(int id) {
        return userDao.deleteById(id);
    }
}
```

## UserController.java

```java
/**
 * 用户控制层
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户
     */
    @GetMapping("/list")
    public List<User> getUserList() {
        return userService.queryAll();
    }
    
    
    /**
     * 根据id查询
     */
    @GetMapping("/{id}")
    public User queryById(@PathVariable("id") int id) {
        return userService.queryById(id);
    }

    
    /**
     * 根据username查询
     */
    @GetMapping("/name/{username}")
    public User queryById(@PathVariable("username") String username) {
        return userService.queryByUsername(username);
    }
    
    
    /**
     * 添加用户信息
     */
    @PostMapping()
    public int saveUser(@RequestBody User user) {
        return userService.saveUser(user);
    }


    /**
     * 修改用户信息
     */
    @PutMapping()
    public int updateById(@RequestBody User user) {
        return userService.updateById(user);
    }


    /**
     * 根据id删除
     */
    @DeleteMapping("/{id}")
    public int deleteById(@PathVariable("id") int id) {
        return userService.deleteById(id);
    }
}

```

## application.yml

```yaml
mybatis-plus:
  global-config:
    db-config:
      # 主键自增
      id-type: auto
```
