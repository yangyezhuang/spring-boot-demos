package com.yyz.jpa.service.impl;

import com.yyz.jpa.dao.UserDao;
import com.yyz.jpa.pojo.User;
import com.yyz.jpa.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll() {
        return userDao.findAll();
    }

    @Override
    public User queryById(int id) {
        return userDao.getById(id);
    }

    @Override
    public User getByUsername(String username) {
        return userDao.getByUsername(username);
    }

    @Override
    public User saveUser(User user) {
        return userDao.save(user);
    }

    @Override
    public User updateById(User user) {
        int userId = user.getId();
        User oldUser = userDao.findById(userId).get();
        BeanUtils.copyProperties(user, oldUser);
        return userDao.save(oldUser);
    }

    @Override
    public void deleteById(int id) {
        userDao.deleteById(id);
    }

}
