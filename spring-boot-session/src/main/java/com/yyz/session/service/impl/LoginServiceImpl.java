package com.yyz.session.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yyz.session.dao.UserDao;
import com.yyz.session.model.User;
import com.yyz.session.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * LoginServiceImpl
 *
 * @author: YZ.YANG
 * @date: 2023-10-04 10:45
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;

    @Override
    public User queryByUsername(String username) {
        User user = userDao.selectOne(new QueryWrapper<User>().eq("username", username));
        return user;
    }
}
