package com.yyz.jwt.service;

import com.yyz.jwt.dao.UserDao;
import com.yyz.jwt.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * UserService
 */
@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public User login(String username) {
        return userDao.queryByUsername(username);
    }
}
