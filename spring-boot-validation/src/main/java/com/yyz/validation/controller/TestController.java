package com.yyz.validation.controller;

import com.yyz.validation.config.ValidationGroups;
import com.yyz.validation.pojo.User;
import com.yyz.validation.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 控制层
 */
@RestController
public class TestController {
    @Autowired
    IUserService userService;


    /**
     * 查询用户
     *
     * @return
     */
    @GetMapping("/user/list")
    public List<User> userList() {
        return userService.queryAll();
    }


    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    @PostMapping("/user")
    public int save(@RequestBody @Validated(value = ValidationGroups.Insert.class) User user) {
        return userService.saveUser(user);
    }


    /**
     * 修改信息
     */
    @PutMapping("/user")
    public User update(@RequestBody @Validated(ValidationGroups.Update.class) User user) {
        return userService.updateUser(user);
    }
}
