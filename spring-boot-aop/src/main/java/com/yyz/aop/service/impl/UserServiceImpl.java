package com.yyz.aop.service.impl;

import com.yyz.aop.pojo.User;
import com.yyz.aop.service.IUserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Override
    public int saveUser() {
        User user1 = new User();
        user1.setId(1);
        user1.setName("jerry");
        user1.setEmail("jerry@gmail.com");
        System.out.println(user1);
        return 0;
    }

}
