# spring-boot-redis

> 此 demo 主要演示了 Spring Boot 如何集成 redis 。

## pom.xml

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
    <version>3.1.1</version>
</dependency>
```

## RedisConfig.java

```java
/**
 * Redis配置类
 */
@Configuration
public class RedisConfig {

    /**
     * 配置缓存管理器
     *
     * @param factory Redis 线程安全连接工厂
     * @return 缓存管理器
     */
    @Bean
    public CacheManager cacheManager(RedisConnectionFactory factory) {
        // 生成两套默认配置，通过 Config 对象即可对缓存进行自定义配置
        RedisCacheConfiguration cacheConfig = RedisCacheConfiguration.defaultCacheConfig()
                // 设置过期时间 2 分钟
                .entryTtl(Duration.ofMinutes(10))
                // 设置缓存前缀
                .prefixKeysWith("cache:user:")
                // 禁止缓存 null 值
                .disableCachingNullValues()
                // 设置 key 序列化
                .serializeKeysWith(keyPair())
                // 设置 value 序列化
                .serializeValuesWith(valuePair());
        
        // 返回 Redis 缓存管理器
        return RedisCacheManager.builder(factory)
                .withCacheConfiguration("user", cacheConfig)
                .build();
    }

    /**
     * 配置键序列化
     */
    private RedisSerializationContext.SerializationPair<String> keyPair() {
        return RedisSerializationContext.SerializationPair.fromSerializer(new StringRedisSerializer());
    }

    /**
     * 配置值序列化，使用 GenericJackson2JsonRedisSerializer 替换默认序列化
     */
    private RedisSerializationContext.SerializationPair<Object> valuePair() {
        return RedisSerializationContext.SerializationPair.fromSerializer(new GenericJackson2JsonRedisSerializer());
    }

}
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
    
    int deleteById(int id);
}
```

## UserServiceImpl.java

```java
/**
 * 用户接口实现类
 */
@Slf4j
@CacheConfig(cacheNames = "user")
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Cacheable(key = "'users'", value = "users")
    @Override
    public List<User> queryAll() {
        List<User> users = userDao.queryAll();
        log.info("查询数据库【queryAll】：" + users);
        return users;
    }


    /**
     * 结果为空时不缓存
     */
    @Cacheable(key = "#id", value = "user", unless = "#result == null")
    @Override
    public User queryById(int id) {
        User user = userDao.queryById(id);
        log.info("查询数据库【queryById】：" + user);
        return user;
    }


    @CachePut(key = "#user.id", value = "user")
    @Transactional
    @Override
    public int saveUser(User user) {
        return userDao.saveUser(user);
    }


    @CachePut(key = "#user.id", value = "user")
    @Transactional
    @Override
    public User updateById(User user) {
        // 修改用户信息
        int i = userDao.updateById(user);
        // 查询修改后的信息
        if (i == 1) {
            User newUser = userDao.queryById(user.getId());
            return newUser;
        }
        return null;
    }


    @CacheEvict(key = "#id")
    @Transactional
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
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户信息
     */
    @GetMapping("/list")
    public List<User> getUserList() {
        return userService.queryAll();
    }


    /**
     * 根据id查询用户
     */
    @GetMapping("/{id}")
    public User queryById(@PathVariable("id") int id) {
        return userService.queryById(id);
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
    public User updateById(@RequestBody User user) {
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

## RedisApplication.java

```java
@MapperScan(basePackages = "com.yyz.redis.dao")
@EnableCaching
@SpringBootApplication
public class RedisApplication {
    public static void main(String[] args) {
        SpringApplication.run(RedisApplication.class, args);
    }
}
```

## application.yml

```yaml
spring:
  datasource:
    password: mysql
    url: jdbc:mysql://localhost:3306/test_db?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
    username: root
    driver-class-name: com.mysql.cj.jdbc.Driver
  # redis配置
  redis:
    host: 127.0.0.1
    port: 6379
    timeout: 5000
    database: 0
    lettuce:
      pool:
        max-active: 8
        max-idle: 8
        max-wait: -1ms
        min-idle: 0

mybatis:
  mapper-locations: classpath:mapper/*.xml
```

## UserMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >

<mapper namespace="com.yyz.redis.dao.UserDao">

    <resultMap type="com.yyz.redis.pojo.User" id="UserMap">
        <result property="id" column="id" jdbcType="INTEGER"/>
        <result property="username" column="username" jdbcType="VARCHAR"/>
        <result property="password" column="password" jdbcType="VARCHAR"/>
        <result property="sex" column="sex" jdbcType="VARCHAR"/>
        <result property="age" column="age" jdbcType="INTEGER"/>
    </resultMap>

    <select id="queryAll" resultType="map">
        select * from user;
    </select>

    <select id="queryById" resultType="com.yyz.redis.pojo.User">
        select * from user where id=#{id};
    </select>

    <insert id="saveUser" parameterType="com.yyz.redis.pojo.User">
        insert into user (username,password,sex,age) values
        (#{username},#{password},#{sex},#{age});
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

    <delete id="deleteById">
        delete from user where id=#{id};
    </delete>

</mapper>
```