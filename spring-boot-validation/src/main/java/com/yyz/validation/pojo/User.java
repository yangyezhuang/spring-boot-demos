package com.yyz.validation.pojo;

import com.yyz.validation.config.EnumString;
import com.yyz.validation.config.ValidationGroups;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

/**
 * User 实体类
 *
 * @author YZ.YANG
 * @date 2023/8/27 18:53
 */
@Data
public class User {

    @NotEmpty(message = "修改用户ID不能为空", groups = ValidationGroups.Update.class)
    int id;

    @NotEmpty(message = "添加用户名称不能为空", groups = ValidationGroups.Insert.class)
    @NotEmpty(message = "修改用户名称不能为空", groups = ValidationGroups.Update.class)
    String username;

    @NotEmpty(message = "密码不能为空")
    @Size(min = 5, message = "密码长度至少5个字符")
    String password;

    @NotEmpty(message = "性别不能为空")
    @EnumString(value = {"男", "女"}, message = "性别只允许为男或女", groups = ValidationGroups.Insert.class)
    String sex;

    @NotEmpty(message = "年龄不能为空")
    @Max(value = 100, message = "年龄不能超过100岁")
    int age;

}
