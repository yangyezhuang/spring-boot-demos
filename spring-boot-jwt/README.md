# spring-boot-jwt

> 此 demo 主要演示了 Spring Boot 如何集成 JWT

## pom.xml

```xml
<dependency>
    <groupId>com.auth0</groupId>
    <artifactId>java-jwt</artifactId>
    <version>3.8.3</version>
</dependency>
```

## JwtUtil.java

```java
@Slf4j
@Service
public class JwtUtil {

    /**
     * 生成token
     *
     * @param user
     * @return
     */
    public static String createToken(User user) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 7); //默认令牌过期时间7天

        JWTCreator.Builder builder = JWT.create();

        builder.withClaim("uid", user.getId())
                .withClaim("username", user.getUsername())
                .withClaim("sex", user.getSex())
                .withClaim("age", user.getAge())
                .withClaim("role", "user");

        return builder.withExpiresAt(calendar.getTime())
                .sign(Algorithm.HMAC256(user.getPassword()));
    }


    /**
     * 解析token
     *
     * @param token
     * @return
     */
    public static DecodedJWT verifyToken(String token) {
        if (token == null) {
            log.info("token不能为空");
        }

        //获取数据库中用户真正的密码
        String password = "123";
        JWTVerifier build = JWT.require(Algorithm.HMAC256(password)).build();
        return build.verify(token);
    }
}
```

## JWTInterceptor.java

```java
/**
 * token 拦截器
 */
@Slf4j
public class JWTInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String token = request.getHeader("token");
        log.info("token：" + token);

        if (token == null) {
            log.error("token为空");
        }
        try {
            JwtUtil.verifyToken(token);
        } catch (SignatureVerificationException e) {
            log.error("无效签名");
            return false;
        } catch (TokenExpiredException e) {
            log.error("token过");
            return false;
        } catch (AlgorithmMismatchException e) {
            log.error("token算法不一致");
            return false;
        } catch (Exception e) {
            log.error("token无效");
            return false;
        }
        return true;
    }
}
```

## InterceptorConfig.java

```java
/**
 * JWT拦截器
 */
@Configuration
public class IntercaptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new JWTInterceptor())
                //拦截的路径
                .addPathPatterns("/info/*", "/test")
                //排除接口
                .excludePathPatterns("/", "/login", "/register");
    }
}
```

## UserController.java

```java
@Slf4j
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        // 查询数据库用户信息
        User u = userService.login(user.getUsername());
        // 判断用户名信息是否正确
        if (user.getUsername().equals(u.getUsername()) & user.getPassword().equals(u.getPassword())) {
            String token = JwtUtil.createToken(u);
            return token;
        } else {
            return "用户名或密码错误";
        }
    }

    @GetMapping("/info/{username}")
    public User info(@PathVariable("username") String username) {
        User u = userService.login(username);
        log.info(u.toString());
        return u;
    }

    @GetMapping("/test")
    public String info(HttpServletRequest request) {
        String token = request.getHeader("token");
        log.info("token验证通过：{}", token);
        return "This is test";
    }
}
```
