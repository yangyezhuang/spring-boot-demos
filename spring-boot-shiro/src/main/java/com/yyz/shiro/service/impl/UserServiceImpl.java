package com.yyz.shiro.service.impl;

import com.yyz.shiro.pojo.User;
import com.yyz.shiro.service.IUserService;
import com.yyz.shiro.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    UserDao userDao;

    @Override
    public User queryByUsername(String username) {
        return userDao.queryByUsername(username);
    }

}
