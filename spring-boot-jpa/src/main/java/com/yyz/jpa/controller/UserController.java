package com.yyz.jpa.controller;

import com.yyz.jpa.pojo.User;
import com.yyz.jpa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户控制层
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户信息
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
     * 根据用户名查询
     *
     * @param username
     * @return
     */
    @GetMapping("/username/{username}")
    public User queryById(@PathVariable("username") String username) {
        return userService.getByUsername(username);
    }


    /**
     * 添加用户信息
     *
     * @param user
     * @return
     */
    @PostMapping()
    public User saveUser(@RequestBody User user) {
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
    public String deleteById(@PathVariable("id") int id) {
        userService.deleteById(id);
        return "删除成功";
    }
}
