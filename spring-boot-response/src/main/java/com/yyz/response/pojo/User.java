package com.yyz.response.pojo;

import lombok.Data;

/**
 * 用户实体类
 *
 * @author YZ.YANG
 * @date 2023/8/31 11:30
 */
@Data
public class User {
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
