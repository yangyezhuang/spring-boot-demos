package com.yyz.mail.service;

import javax.servlet.http.HttpSession;

/**
 * MailService
 *
 * @author YangYezhuang
 * @date 2023/8/21 19:00
 */
public interface MailService {

    boolean sendMail(String email);
}
