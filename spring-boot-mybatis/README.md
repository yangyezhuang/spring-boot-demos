# spring-boot-mybatis

> 此 demo 主要演示了 Spring Boot 如何集成 mybatis 。

## pom.xml

```xml
<dependencies>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.30</version>
    </dependency>

    <dependency>
        <groupId>org.mybatis.spring.boot</groupId>
        <artifactId>mybatis-spring-boot-starter</artifactId>
        <version>2.3.0</version>
    </dependency>
</dependencies>
```

## User.java

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

```java
/**
 * 用户接口
 */
@Mapper
public interface UserDao {

    List<User> queryAll();

    User queryById(int id);

    int saveUser(User user);

    int updateById(User user);
    
    // 使用注解的形式
    @Delete("delete from user where id=#{id}")
    int deleteById(int id);
}
```

## UserService.java

```java
/**
 * 用户接口
 */
public interface UserService extends UserDao {
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
        return userDao.queryAll();
    }

    @Override
    public User queryById(int id) {
        return userDao.queryById(id);
    }

    @Override
    public int saveUser(User user) {
        return userDao.saveUser(user);
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

> 主要演示API层的注解。

```java
/**
 * 用户控制层
 *
 * @author YangYezhuang
 * @date 2023/8/15 18:30
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
     * 添加用户信息
     *
     * @param user
     * @return
     */
    @PostMapping()
    public int saveUser(@RequestBody User user) {
        return userService.saveUser(user);
    }


    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @PutMapping()
    public int updateById(@RequestBody User user) {
        return userService.updateById(user);
    }


    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public int deleteById(@PathVariable("id") int id) {
        return userService.deleteById(id);
    }
}

```

## MybatisApplication.java

```java
@MapperScan(basePackages = "com.yyz.mybatis.dao")
@SpringBootApplication
public class MybatisApplication {

    public static void main(String[] args) {
        SpringApplication.run(MybatisApplication.class, args);
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

mybatis:
  mapper-locations: classpath:mapper/*.xml
```

## UserMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.yyz.mybatis.dao.UserDao">

    <resultMap type="com.yyz.mybatis.pojo.User" id="UserMap">
        <result property="id" column="id" jdbcType="INTEGER"/>
        <result property="username" column="username" jdbcType="VARCHAR"/>
        <result property="password" column="password" jdbcType="VARCHAR"/>
        <result property="sex" column="sex" jdbcType="VARCHAR"/>
        <result property="age" column="age" jdbcType="INTEGER"/>
    </resultMap>

    <select id="queryAll" resultType="map">
        select * from user;
    </select>

    <select id="queryById" resultType="com.yyz.mybatis.pojo.User">
        select * from user where id=#{id};
    </select>

    <insert id="saveUser" parameterType="com.yyz.mybatis.pojo.User">
        insert into user (username,password,sex,age) values (#{username},#{password},#{sex},#{age});
    </insert>

    <update id="updateById">
        update user set
        <if test="username != null">
            username=#{username},
        </if>
        <if test="password != null">
            password=#{password},
        </if>
        <if test="sex != null">
            sex=#{sex},
        </if>
        <if test="age != null">
            age=#{age}
        </if>
        where id=#{id};
    </update>

</mapper>
```