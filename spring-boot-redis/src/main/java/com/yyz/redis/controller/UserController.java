package com.yyz.redis.controller;

import com.yyz.redis.pojo.User;
import com.yyz.redis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户控制层
 *
 * @author YangYezhuang
 * @date 2023/8/21 18:30
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户
     *
     * @return
     */
    @GetMapping("/list")
    public List<User> getUserList() {
        return userService.queryAll();
    }


    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public User queryById(@PathVariable("id") int id) {
        return userService.queryById(id);
    }


    /**
     * 添加用户信息
     *
     * @param user
     * @return
     */
    @PostMapping()
    public int saveUser(@RequestBody User user) {
        return userService.saveUser(user);
    }


    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @PutMapping()
    public User updateById(@RequestBody User user) {
        return userService.updateById(user);
    }


    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public int deleteById(@PathVariable("id") int id) {
        return userService.deleteById(id);
    }
}
