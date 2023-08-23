package com.yyz.aop.service.impl;

import com.yyz.aop.service.IUserService;
import com.yyz.aop.pojo.User;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Override
    public int saveUser() {
        User user1 = new User(1, "tom", "tom@qq.com");
        System.out.println(user1);
        return 0;
    }

}
