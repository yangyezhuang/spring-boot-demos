package com.yyz.response.service.impl;

import com.yyz.response.dao.UserDao;
import com.yyz.response.pojo.User;
import com.yyz.response.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YZ.YANG
 * @date 2023/8/31 11:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll() {
        return userDao.queryAll();
    }

}
