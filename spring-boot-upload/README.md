# spring-boot-upload

> 此 demo 主要演示了 Spring Boot 如何实现文件上传


## FileController.java
```java
@RestController
public class FileController {

    @Autowired
    FileService fileService;

    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "上传失败，请选择文件";
        }
        boolean result = fileService.upload(file);
        if (result) {
            return "上传成功";
        }
        return "上传成功";
    }


    @PostMapping("/uploadFiles")
    public String uploadFiles(@RequestParam("files") MultipartFile[] files) {
        if (files.length == 0) {
            return "上传失败，请选择文件";
        }
        boolean result = fileService.uploadFiles(files);
        if (result) {
            return "上传成功";
        }
        return "上传失败";
    }

}
```

## FileService.java
```java
public interface FileService {

    boolean upload(MultipartFile file);

    boolean uploadFiles(MultipartFile[] files);
}
```

## FileServiceImpl.java
```java
@Service
public class FileServiceImpl implements FileService {
    @Value("${file.path}")
    private String path;

    @Override
    public boolean upload(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        String filePath = path + fileName;
        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean uploadFiles(MultipartFile[] files) {
        for (MultipartFile file : files) {
            String fileName = file.getOriginalFilename();
            String filePath = path + fileName;
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return true;
    }
}
```



## application.yml

```yaml
spring:
  servlet:
    multipart:
      max-file-size: 10MB
      max-request-size: 10MB

file:
  path: D:\Media\
```
