package com.yyz.jdbc.pojo;

import lombok.Data;

/**
 * 用户实体类
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
@Data
public class User {
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
