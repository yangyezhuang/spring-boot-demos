package com.yyz.mail.service.impl;

import com.yyz.mail.service.MailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * service
 *
 * @author YangYezhuang
 * @date 2023/8/21 19:00
 */
@Service
public class MailServiceImpl implements MailService {

    private static final Logger log = LoggerFactory.getLogger(MailServiceImpl.class);


    @Autowired
    JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String from;

    /**
     * 发送验证码
     *
     * @param email
     * @return
     */
    @Override
    public boolean sendMail(String email) {
        try {
            // 生成六位数验证码
            int verifyCode = (int) ((Math.random() * 9 + 1) * 100000);
            log.info("验证码：" + verifyCode);
            // 构造邮件
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setSubject("在线测试平台注册");
            mailMessage.setText("您的注册验证码是：" + verifyCode);
            mailMessage.setTo(email);
            mailMessage.setFrom(from);
            javaMailSender.send(mailMessage);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
