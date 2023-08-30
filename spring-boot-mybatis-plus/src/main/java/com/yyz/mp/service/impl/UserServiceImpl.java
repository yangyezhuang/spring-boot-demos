package com.yyz.mp.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yyz.mp.dao.UserDao;
import com.yyz.mp.pojo.User;
import com.yyz.mp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll() {
        return userDao.selectList(null);
    }

    @Override
    public User queryById(int id) {
        return userDao.selectById(id);
    }

    @Override
    public User queryByUsername(String username) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        return userDao.selectOne(wrapper);
    }

    @Override
    public int saveUser(User user) {
        return userDao.insert(user);
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
