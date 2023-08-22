# SpringBoot 集成 POI

## pom.xml

```xml
<dependencies>
    <!--xls-->
    <dependency>
        <groupId>org.apache.poi</groupId>
        <artifactId>poi</artifactId>
        <version>5.2.3</version>
    </dependency>

    <!--xlsx-->
    <dependency>
        <groupId>org.apache.poi</groupId>
        <artifactId>poi-ooxml</artifactId>
        <version>5.2.3</version>
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

## UserController.java

```java
/**
 * Excel 控制层
 */
public class PoiExcelController {

    @Autowired
    UserService userService;

    @PostMapping("/upload")
    public void upload(@RequestBody MultipartFile file) throws Exception {
        userService.importExcel(file);
    }

    @GetMapping("/download")
    public void download(HttpServletResponse response) throws Exception {
        userService.exportExcel(response);
    }

}
```

## UserDao.java

```java
/**
 * 用户接口
 */
@Mapper
public interface UserDao {
    List<User> getAll();
    
    int save(User user);
}
```


## UserServiceImpl.java

```java
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    /**
     * 将表格数据导入到数据库
     *
     * @param file
     * @throws Exception
     */
    @Transactional
    @Override
    public void importExcel(MultipartFile file) throws Exception {
        // 获取文件流
        InputStream inputStream = file.getInputStream();
        // 创建工作簿
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        // 得到工作表
        Sheet sheet = workbook.getSheetAt(0);

        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            //读取行
            Row row = sheet.getRow(i);
            //读取单元格
            Cell cell0 = row.getCell(0);
            Cell cell1 = row.getCell(1);
            Cell cell2 = row.getCell(2);
            Cell cell3 = row.getCell(3);
            Cell cell4 = row.getCell(4);
            // 设置单元格类型
            cell0.setCellType(CellType.STRING);
            cell1.setCellType(CellType.STRING);
            cell2.setCellType(CellType.STRING);
            cell3.setCellType(CellType.STRING);
            cell4.setCellType(CellType.STRING);
            // 构造数据
            User user = new User();
            user.setId(Integer.parseInt(cell0.getStringCellValue()));
            user.setUsername(cell1.getStringCellValue());
            user.setPassword(cell2.getStringCellValue());
            user.setSex(cell3.getStringCellValue());
            user.setAge(Integer.parseInt(cell4.getStringCellValue()));
            // 保存数据
            userDao.save(user);
        }
        inputStream.close();
    }


    /**
     * 将数据库数据导出为excel
     *
     * @param response
     * @throws Exception
     */
    @Override
    public void exportExcel(HttpServletResponse response) throws Exception {
        // 查询数据
        List<User> list = userDao.getAll();
        // 生成表格
        SXSSFWorkbook workbook1 = new SXSSFWorkbook();
        Sheet sheet = workbook1.createSheet();

        int rowNum = 0;
        Row row;
        for (User user : list) {
            //创建行
            row = sheet.createRow(rowNum);

            Cell cell0 = row.createCell(0);
            cell0.setCellValue(user.getId());

            Cell cell1 = row.createCell(1);
            cell1.setCellValue(user.getUsername());

            Cell cell2 = row.createCell(2);
            cell2.setCellValue(user.getPassword());

            Cell cell3 = row.createCell(3);
            cell3.setCellValue(user.getSex());

            Cell cell4 = row.createCell(4);
            cell4.setCellValue(user.getAge());

            rowNum++;
        }

        // 设置响应信息
        String filename = URLEncoder.encode("POI导出测试", "utf-8");
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xlsx");
        // 写入excel
        workbook1.write(response.getOutputStream());
        // 清除临时文件
        ((SXSSFWorkbook) workbook1).dispose();
        response.getOutputStream().close();
    }

}
```



## PoiExcelApplication.java
```java
@MapperScan(basePackages = "com.yyz.poi.dao")
@SpringBootApplication
public class PoiExcelApplication {
    public static void main(String[] args) {
        SpringApplication.run(PoiExcelApplication.class, args);
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
<mapper namespace="com.yyz.poi.dao.UserDao">

    <resultMap type="com.yyz.poi.pojo.User" id="UserMap">
        <result property="id" column="id" jdbcType="INTEGER"/>
        <result property="username" column="username" jdbcType="VARCHAR"/>
        <result property="password" column="password" jdbcType="VARCHAR"/>
        <result property="sex" column="sex" jdbcType="VARCHAR"/>
        <result property="age" column="age" jdbcType="INTEGER"/>
    </resultMap>

    <select id="findAll" resultMap="userMap">
        select * from test_excel;
    </select>

    <insert id="save" parameterType="com.yyz.poi.pojo.User">
        insert into test_excel (id, username, password, sex, age) values
        (#{id}, #{username}, #{password}, #{sex}, #{age});
    </insert>
</mapper>
```