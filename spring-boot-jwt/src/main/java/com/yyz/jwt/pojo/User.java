package com.yyz.jwt.pojo;

import lombok.Data;

/**
 * User实体类
 */
@Data
public class User {
    int id;
    String username;
    String password;
    String sex;
    int age;
}
