package com.yyz.aop.service.impl;

import com.yyz.aop.aspect.ToSendLog;
import com.yyz.aop.service.IMailService;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements IMailService {

    @ToSendLog
    @Override
    public String sendMail(String email) {
        System.out.println("向 " + email + " 发送邮件");
        return "发送成功";
    }
}
