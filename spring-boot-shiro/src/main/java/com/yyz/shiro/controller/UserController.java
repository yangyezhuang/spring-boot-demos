package com.yyz.shiro.controller;

import com.yyz.shiro.pojo.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 控制层
 */
@Controller
public class UserController {
    private static final Logger log = LoggerFactory.getLogger(UserController.class);

    @RequestMapping({"/"})
    public String index() {
        return "index";
    }

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "views/login";
    }

    @PostMapping("/login")
    public String login(User u) {
        // 获取当前用户
        Subject subject = SecurityUtils.getSubject();
        // 封装用户登陆数据
        UsernamePasswordToken token = new UsernamePasswordToken(u.getUsername(), u.getPassword());
        // 使用shiro进行登录验证
        try {
            subject.login(token);
            subject.getPrincipal();
            log.info("Principal: {}", subject.getPrincipal());
            return "index";
        } catch (UnknownAccountException e) {
            log.info("账号错误");
            return "index";
        } catch (IncorrectCredentialsException e) {
            log.info("密码错误");
            return "index";
        }
    }

    @RequestMapping("/logout")
    public String logout() {
        return "views/login";
    }

    @RequestMapping("/level1/{id}")
    public String level1(@PathVariable("id") int id) {
        return "views/level1/" + id;
    }

    @RequestMapping("/level2/{id}")
    public String level2(@PathVariable("id") int id) {
        return "views/level2/" + id;
    }

    @GetMapping("/level3/{id}")
    public String level3(@PathVariable("id") int id) {
        return "views/level3/" + id;
    }
}
