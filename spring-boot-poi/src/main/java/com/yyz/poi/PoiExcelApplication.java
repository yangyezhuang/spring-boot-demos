package com.yyz.poi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = "com.yyz.poi.dao")
@SpringBootApplication
public class PoiExcelApplication {

    public static void main(String[] args) {
        SpringApplication.run(PoiExcelApplication.class, args);
    }

}
