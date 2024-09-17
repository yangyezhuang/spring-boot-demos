package com.yyz.session.controller;

import com.yyz.session.model.User;
import com.yyz.session.service.LoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 登录接口管理
 *
 * @author: YZ.YANG
 * @date: 2023-10-04 10:45
 */
@RestController
public class LoginController {

    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private LoginService loginService;

    /**
     * 登录
     *
     * @param user
     * @param session
     * @return
     */
    @PostMapping("/login")
    public String login(@RequestBody User user, HttpSession session) {
        User userInfo = loginService.queryByUsername(user.getUsername());

        if (userInfo == null) {
            throw new RuntimeException("用户不存在");
        }

        if (!user.getPassword().equals(userInfo.getPassword())) {
            throw new RuntimeException("密码错误");
        }

        session.setAttribute("userId", userInfo);
        log.info("{} 登陆成功, {}", user.getUsername(), new Date());

        return "登陆成功";
    }


    /**
     * 测试
     *
     * @return
     */
    @GetMapping("/user/{username}")
    public String getUserInfo(@PathVariable("username") String username) {
        return "测试成功：" + username;
    }

}
