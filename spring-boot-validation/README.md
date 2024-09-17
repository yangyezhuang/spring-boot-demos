# spring-boot-validation

> 此 demo 主要演示了 Spring Boot 如何集成 validation

## pom

````xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-validation</artifactId>
</dependency>
````

## User.java

```java
/**
 * User 实体类
 */
@Data
public class User {

    @NotEmpty(message = "修改用户ID不能为空", groups = ValidationGroups.Update.class)
    int id;

    @NotEmpty(message = "添加用户名称不能为空", groups = ValidationGroups.Insert.class)
    @NotEmpty(message = "修改用户名称不能为空", groups = ValidationGroups.Update.class)
    String username;

    @NotEmpty(message = "密码不能为空")
    @Size(min = 5, message = "密码长度至少5个字符")
    String password;

    @NotEmpty(message = "性别不能为空")
    @EnumString(value = {"男", "女"}, message = "性别只允许为男或女", groups = ValidationGroups.Insert.class)
    String sex;

    @NotEmpty(message = "年龄不能为空")
    @Max(value = 100, message = "年龄不能超过100岁")
    int age;

}
```

## EnumString.java

自定义注解

```java
@Target({METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE})
@Retention(RUNTIME)
@Repeatable(EnumString.List.class)
@Documented
@Constraint(validatedBy = EnumStringValidator.class)//标明由哪个类执行校验逻辑
public @interface EnumString {
    String message() default "value not in enum values.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    /**
     * @return date must in this value array
     */
    String[] value();

    /**
     * Defines several {@link EnumString} annotations on the same element.
     *
     * @see EnumString
     */
    @Target({METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE})
    @Retention(RUNTIME)
    @Documented
    @interface List {
        EnumString[] value();
    }
}
```

## EnumStringValidator.java

自定义校验逻辑

```java
public class EnumStringValidator implements ConstraintValidator<EnumString, String> {

    private List<String> enumStringList;

    @Override
    public void initialize(EnumString constraintAnnotation) {
        enumStringList = Arrays.asList(constraintAnnotation.value());
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return true;
        }
        return enumStringList.contains(value);
    }
}
```

## ValidationGroups.java

分组校验

```java
public class ValidationGroups {
    public interface Insert {}

    public interface Update {}
}
```

## TestController.java

控制层

```java
@RestController
public class TestController {
    
    @Autowired
    IUserService userService;


    /**
     * 查询用户
     */
    @GetMapping("/user/list")
    public List<User> userList() {
        return userService.queryAll();
    }


    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    @PostMapping("/user")
    public int save(@RequestBody @Validated(value = ValidationGroups.Insert.class) User user) {
        return userService.saveUser(user);
    }


    /**
     * 修改信息
     */
    @PutMapping("/user")
    public User update(@RequestBody @Validated(ValidationGroups.Update.class) User user) {
        return userService.updateUser(user);
    }
}
```
