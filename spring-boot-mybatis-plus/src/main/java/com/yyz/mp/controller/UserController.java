package com.yyz.mp.controller;

import com.yyz.mp.pojo.User;
import com.yyz.mp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户控制层
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

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
     * 根据username查询用户
     *
     * @param username
     * @return
     */
    @GetMapping("/name/{username}")
    public User queryById(@PathVariable("username") String username) {
        return userService.queryByUsername(username);
    }


    /**
     * 添加用户信息
     *
     * @param user
     * @return
     */
    @PostMapping()
    public String saveUser(@RequestBody User user) {
        boolean result = userService.saveUser(user);
        if (!result) {
            return "添加失败";
        }
        return "添加成功";
    }


    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @PutMapping()
    public String updateById(@RequestBody User user) {
        boolean result = userService.update(user);
        if (!result) {
            return "更新失败";
        }
        return "更新成功";
    }


    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable("id") int id) {
        boolean result = userService.deleteById(id);
        if (!result) {
            return "删除失败";
        }
        return "删除成功";
    }
}
