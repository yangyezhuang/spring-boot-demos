package com.yyz.mail.controller;

import com.yyz.mail.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Mail 控制层
 *
 * @author YangYezhuang
 * @date 2023/8/21 18:54
 */
@RestController
public class MailController {

    @Autowired
    MailService mailService;

    @PostMapping("/send/{email}")
    public String sendMail(@PathVariable("email") String email) {
        boolean result = mailService.sendMail(email);
        if (result) {
            return "发送成功";
        }
        return "发送失败";
    }

}
