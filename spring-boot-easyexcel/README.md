# Springboot 集成 EasyExcel


## pom.xml

```xml
<dependencies>
    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>easyexcel</artifactId>
        <version>3.3.2</version>
    </dependency>

    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>fastjson</artifactId>
        <version>2.0.29</version>
    </dependency>

    <dependency>
        <groupId>joda-time</groupId>
        <artifactId>joda-time</artifactId>
        <version>2.10.10</version>
    </dependency>
</dependencies>
```

## User.java
```java
@Data
@ExcelIgnoreUnannotated
public class UserEntity {
    @ExcelProperty("ID")
    private int id;

    @ExcelProperty("用户名")
    private String username;

    @ExcelProperty("密码")
    private String password;

    @ExcelProperty("性别")
    private String sex;

    @ExcelProperty("年龄")
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

    List<UserEntity> findAll();

    // 如果是mybatis,尽量别直接调用多次insert,自己写一个mapper里面新增一个方法batchInsert,所有数据一次性插入
    int save(UserEntity data);

}
```



## DemoDataListener.java

```java
/**
 * 监听器
 * 
 * 注意：DemoDataListener 不能被spring管理，要每次读取excel都要new,然后里面用到spring可以构造方法传进去
 */
@Slf4j
public class DemoDataListener implements ReadListener<UserEntity> {

    /**
     * 每隔5条存储数据库，实际使用中可以100条，然后清理list ，方便内存回收
     */
    private static final int BATCH_COUNT = 100;
    /**
     * 缓存的数据
     */
    private List<UserEntity> cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);

    /**
     * 这个是一个DAO，当然有业务逻辑这个也可以是一个service。当然如果不用存储这个对象没用。
     */
    private UserDao demoDAO;

    /**
     * 如果使用了spring,请使用这个构造方法。每次创建Listener的时候需要把spring管理的类传进来
     *
     * @param demoDAO
     */
    public DemoDataListener(UserDao demoDAO) {
        this.demoDAO = demoDAO;
    }

    /**
     * 这个每一条数据解析都会来调用
     *
     * @param data
     * @param context
     */
    @Override
    public void invoke(UserEntity data, AnalysisContext context) {
        log.info("解析到一条数据:{}", JSON.toJSONString(data));
        cachedDataList.add(data);
        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (cachedDataList.size() >= BATCH_COUNT) {
            saveData(); //持久化逻辑
            // 存储完成清理 list
            cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
        }
    }

    /**
     * 所有数据解析完成了 都会来调用
     *
     * @param context
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 这里也要保存数据，确保最后遗留的数据也存储到数据库
        saveData();
        log.info("所有数据解析完成！");
    }

    /**
     * 加上存储数据库
     */
    private void saveData() {
        log.info("{}条数据，开始存储数据库！", cachedDataList.size());
        for (UserEntity data : cachedDataList) {
            demoDAO.save(data);
        }
        log.info("存储数据库成功！");
    }
}
```


## UserServiceImpl.java

```java
@Service
public class ExcelServiceImpl implements ExcelService {

    @Autowired
    UserDao demoDAO;

    /**
     * 将excel 导入数据库
     *
     * @param file
     */
    @Override
    public void importExcel(MultipartFile file) throws IOException {
        InputStream inputStream = file.getInputStream();
        // 默认每次读取100条数据 然后返回过来 直接调用使用数据就行，具体需要返回多少行可以在`PageReadListener`的构造函数设置
        EasyExcel.read(inputStream, UserEntity.class, new DemoDataListener(demoDAO)).sheet().doRead();
    }

    /**
     * 将数据导出为 excel
     */
    @Override
    public void exportExcel(HttpServletResponse response) throws IOException {
        // 查询数据
        List<UserEntity> data = demoDAO.findAll();
        // 设置响应信息
        String filename = URLEncoder.encode("user", "utf-8");
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xlsx");
        // 写入excel
        EasyExcel.write(response.getOutputStream(), UserEntity.class).sheet("sheet1").doWrite(data);
    }

}
```


## UserController.java

> 主要演示API层的注解。

```java
/**
 * Excel 控制层
 */
@RestController
public class ExcelController {
    @Autowired
    ExcelService excelService;

    /**
     * 上传excel并导入数据库
     *
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public void upload(@RequestBody MultipartFile file) throws IOException {
        excelService.importExcel(file);
    }

    /**
     * 将数据库数据导出为excel
     *
     * @return
     */
    @GetMapping("/download")
    public void download(HttpServletResponse response) throws IOException {
        excelService.exportExcel(response);
    }

}
```


## MybatisApplication.java
```java
@MapperScan(basePackages = "com.yyz.easyexcel.dao")
@SpringBootApplication
public class EasyExcelApplication {
    public static void main(String[] args) {
        SpringApplication.run(EasyExcelApplication.class, args);
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
<mapper namespace="com.yyz.easyexcel.dao.UserDao">

    <resultMap type="com.yyz.easyexcel.entity.UserEntity" id="UserMap">
        <result property="id" column="id" jdbcType="INTEGER"/>
        <result property="username" column="username" jdbcType="VARCHAR"/>
        <result property="password" column="password" jdbcType="VARCHAR"/>
        <result property="sex" column="sex" jdbcType="VARCHAR"/>
        <result property="age" column="age" jdbcType="INTEGER"/>
    </resultMap>

    <select id="findAll" resultMap="userMap">
        select * from easyexcel;
    </select>

    <insert id="save" parameterType="com.yyz.easyexcel.entity.UserEntity">
        insert into easyexcel (id, username, password, sex, age) values
        (#{id}, #{username}, #{password}, #{sex}, #{age});
    </insert>
</mapper>
```