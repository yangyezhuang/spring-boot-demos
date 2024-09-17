# spring-boot-response

> 此 demo 主要演示了 Spring Boot 如何统一封装数据返回格式

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

## Result.java

封装数据类型

```java
@Data
public class Result {
    private int code;
    private String msg;
    private Object data;

    public void setResultCode(ResultCode code) {
        this.code = code.getCode();
        this.msg = code.getMsg();
    }


    /**
     * 成功 不返回数据直接返回成功信息
     *
     * @return 封装结果
     */
    public static Result success() {
        Result result = new Result();
        result.setResultCode(ResultCode.SUCCESS);
        return result;
    }


    /**
     * 成功 并且加上返回数据
     *
     * @param data 数据
     * @return 封装结果
     */
    public static Result success(Object data) {
        Result result = new Result();
        result.setResultCode(ResultCode.SUCCESS);
        result.setData(data);
        return result;
    }


    /**
     * 成功 自定义成功返回状态 加上数据
     *
     * @param resultCode 状态码
     * @param data       数据
     * @return 封装结果
     */
    public static Result success(ResultCode resultCode, Object data) {
        Result result = new Result();
        result.setResultCode(resultCode);
        result.setData(data);
        return result;
    }


    /**
     * 单返回失败的状态码
     *
     * @param resultCode 状态码
     * @return 封装结果
     */
    public static Result fail(ResultCode resultCode) {
        Result result = new Result();
        result.setResultCode(resultCode);
        return result;
    }


    /**
     * 返回失败的状态码及数据
     *
     * @param resultCode 状态码
     * @param data       数据
     * @return 封装结果
     */
    public static Result fail(ResultCode resultCode, Object data) {
        Result result = new Result();
        result.setResultCode(resultCode);
        result.setData(data);
        return result;
    }

}
```

## ResultCode.java

状态码

```java
public enum ResultCode {
    SUCCESS(1, "成功"),
    FAIL(0, "鼠失败"),
    SERVER_BUSY(503, "服务器正忙，请稍后再试");

    private int code;
    private String msg;

    ResultCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return this.code;
    }

    public String getMsg() {
        return this.msg;
    }
}
```

## ResponseAdvice.java

用来封装统一数据返回格式

```java
@RestControllerAdvice
public class ResponseAdvice implements ResponseBodyAdvice<Object> {
    
    @Autowired
    ObjectMapper objectMapper;

    /**
     * 是否开启功能 true：是
     */
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    /**
     * 处理返回结果
     */
    @SneakyThrows
    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        // 处理字符串类型数据
        if (body instanceof String) {
            return objectMapper.writeValueAsString(Result.success(body));
        }
        // 返回类型是否已经封装
        if (body instanceof Result) {
            return body;
        }
        return Result.success(body);
    }
}
```

## RestExceptionHandler.java

全局异常处理器
> controller中接口发生Exception异常时，就会进入到Execption方法中进行捕获，
> 将杂乱的异常信息，转换成指定格式后交给ResponseAdvice方法进行统一格式封装并返回给前端。

```java
@Slf4j
@RestControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(AuthException.class)
    // public String ErrorHandler(AuthorizationException e) {
    public String ErrorHandler(Exception e) {
        log.error("未通过权限验证！", e);
        return "未通过权限验证！";
    }

    @ExceptionHandler(Exception.class)
    public Result Execption(Exception e) {
        log.error("未知异常！", e);
        return Result.fail(ResultCode.SERVER_BUSY, ResultCode.SERVER_BUSY.getMsg());
    }
}
```

## UserController.java

用户控制层

```java
@RestController
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户
     */
    @GetMapping("/users")
    public List<User> getUserList() {
        return userService.queryAll();
    }

    
    /**
     * 测试触发异常
     */
    @GetMapping("/test")
    public int test() {
        return 1 / 0;
    }

}
```
