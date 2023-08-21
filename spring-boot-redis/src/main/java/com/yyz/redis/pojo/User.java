package com.yyz.redis.pojo;

import lombok.Data;

/**
 * 用户实体类
 *
 * @author YangYezhuang
 * @date 2023/8/21 18:30
 */
@Data
public class User {
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
