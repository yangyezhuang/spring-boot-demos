package com.yyz.swagger.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger配置文件
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket docket() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .groupName("WebApi")
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.yyz.swagger.controller"))
                // 过滤请求路径, PathSelectors.ant("/user/**")
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Swagger学习项目-API文档")
                .description("Api接口定义")
                .version("1.0")
                .contact(new Contact("Yang Yezhuang", "https://github.com/yangyezhuang", "123456@qq.com"))
                .build();
    }

}