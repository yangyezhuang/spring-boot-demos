package com.yyz.mp.pojo;

import lombok.Data;

/**
 * 用户实体类
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
 */
@Data
public class User {
    private Integer id;
    private String username;
    private String password;
    private String sex;
    private Integer age;
}
