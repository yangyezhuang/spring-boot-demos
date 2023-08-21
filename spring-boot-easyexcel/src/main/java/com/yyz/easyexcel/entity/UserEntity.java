package com.yyz.easyexcel.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

/**
 * User
 *
 * @author YangYezhuang
 * @date 2023/8/21 14:02
 */
@Data
@ExcelIgnoreUnannotated
public class UserEntity {
    @ExcelProperty("ID")
    private int id;

    @ExcelProperty("用户名")
    private String username;

    @ExcelProperty("密码")
    private String password;

    @ExcelProperty("性别")
    private String sex;

    @ExcelProperty("年龄")
    private int age;
}
