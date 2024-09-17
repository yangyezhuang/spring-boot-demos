package com.yyz.validation.pojo;

import com.yyz.validation.config.EnumString;
import com.yyz.validation.config.ValidationGroups;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

/**
 * User 实体类
 *
 * @author YZ.YANG
 * @date 2023/8/27 18:53
 */
public class User {

    @NotEmpty(message = "修改用户ID不能为空", groups = ValidationGroups.Update.class)
    private int id;

    @NotEmpty(message = "添加用户名称不能为空", groups = ValidationGroups.Insert.class)
    @NotEmpty(message = "修改用户名称不能为空", groups = ValidationGroups.Update.class)
    private String username;

    @NotEmpty(message = "密码不能为空")
    @Size(min = 5, message = "密码长度至少5个字符")
    private String password;

    @NotEmpty(message = "性别不能为空")
    @EnumString(value = {"男", "女"}, message = "性别只允许为男或女", groups = ValidationGroups.Insert.class)
    private String sex;

    @NotEmpty(message = "年龄不能为空")
    @Max(value = 100, message = "年龄不能超过100岁")
    private int age;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
