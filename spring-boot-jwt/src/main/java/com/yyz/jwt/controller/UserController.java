package com.yyz.jwt.controller;

import com.yyz.jwt.pojo.User;
import com.yyz.jwt.service.UserService;
import com.yyz.jwt.jwt.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * User控制层
 */
@Slf4j
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        // 查询数据库用户信息
        User u = userService.login(user.getUsername());
        // 判断用户名信息是否正确
        if (user.getUsername().equals(u.getUsername()) & user.getPassword().equals(u.getPassword())) {
            String token = JwtUtil.createToken(u);
            return token;
        } else {
            return "用户名或密码错误";
        }
    }

    @GetMapping("/info/{username}")
    public User info(@PathVariable("username") String username) {
        User u = userService.login(username);
        log.info(u.toString());
        return u;
    }

    @GetMapping("/test")
    public String info(HttpServletRequest request) {
        String token = request.getHeader("token");
        log.info("token验证通过：{}", token);
        return "This is test";
    }
}
