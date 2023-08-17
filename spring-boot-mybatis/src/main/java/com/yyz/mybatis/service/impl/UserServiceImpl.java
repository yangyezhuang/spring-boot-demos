package com.yyz.mybatis.service.impl;

import com.yyz.mybatis.dao.UserDao;
import com.yyz.mybatis.pojo.User;
import com.yyz.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YangYezhuang
 * @date 2023/8/15 18:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll() {
        return userDao.queryAll();
    }

    @Override
    public User queryById(int id) {
        return userDao.queryById(id);
    }

    @Override
    public int saveUser(User user) {
        return userDao.saveUser(user);
    }

    @Override
    public int updateById(User user) {
        return userDao.updateById(user);
    }

    @Override
    public int deleteById(int id) {
        return userDao.deleteById(id);
    }
}
