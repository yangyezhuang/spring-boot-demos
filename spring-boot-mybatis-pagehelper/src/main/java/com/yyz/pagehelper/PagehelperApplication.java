package com.yyz.pagehelper;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.yyz.pagehelper.dao")
@SpringBootApplication
public class PagehelperApplication {

    public static void main(String[] args) {
        SpringApplication.run(PagehelperApplication.class, args);
    }

}
