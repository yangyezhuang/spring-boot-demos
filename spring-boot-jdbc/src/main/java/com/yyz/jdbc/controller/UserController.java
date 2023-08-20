package com.yyz.jdbc.controller;

import com.yyz.jdbc.pojo.User;
import com.yyz.jdbc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
    public List<Map<String, Object>> getUserList() {
        return userService.queryAll();
    }


    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Map<String, Object> queryById(@PathVariable("id") int id) {
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
    public Map<String, Object> updateById(@RequestBody User user) {
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
