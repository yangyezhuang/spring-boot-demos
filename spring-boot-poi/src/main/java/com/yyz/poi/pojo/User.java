package com.yyz.poi.pojo;

import lombok.Data;

/**
 * User
 *
 * @author YangYezhuang
 * @date 2023/8/22 14:01
 */
@Data
public class User {
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
