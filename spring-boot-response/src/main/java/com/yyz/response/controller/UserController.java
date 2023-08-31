package com.yyz.response.controller;

import com.yyz.response.pojo.User;
import com.yyz.response.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 用户控制层
 *
 * @author YZ.YANG
 * @date 2023/8/31 11:30
 */
@RestController
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户信息
     *
     * @return
     */
    @GetMapping("/users")
    public List<User> getUserList() {
        return userService.queryAll();
    }


    /**
     * 测试触发异常
     *
     * @return
     */
    @GetMapping("/test")
    public int test() {
        return 1 / 0;
    }

}
