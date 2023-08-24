package com.yyz.minio;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = "com.yyz.minio.mapper")
@SpringBootApplication
public class MinioApplication {

    public static void main(String[] args) {
        SpringApplication.run(MinioApplication.class, args);
    }

}
