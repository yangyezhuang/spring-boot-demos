package com.yyz.properties.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 读取配置文件
 *
 * @author YangYezhuang
 * @date 2023/8/16 10:36
 */
@RestController
public class UserController {

    @Value("${user.username}")
    private String name;

    @Value("${user.sex}")
    private String sex;

    @Value("${user.age}")
    private int age;

    @GetMapping("/user")
    public String getUser() {
        return "用户名: " + name + "，性别: " + sex + "，年龄: " + age;
    }
}
