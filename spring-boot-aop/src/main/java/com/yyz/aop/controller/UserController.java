package com.yyz.aop.controller;

import com.yyz.aop.service.IMailService;
import com.yyz.aop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IMailService mailService;

    @GetMapping("/user")
    public int save() {
        return userService.saveUser();
    }


    @GetMapping("/send/{email}")
    public String sendMail(@PathVariable("email") String email) {
        return mailService.sendMail(email);
    }

}
