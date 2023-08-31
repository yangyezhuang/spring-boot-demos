package com.yyz.response;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.yyz.response.dao")
@SpringBootApplication
public class ResponseApplication {

	public static void main(String[] args) {
		SpringApplication.run(ResponseApplication.class, args);
	}

}
