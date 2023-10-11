package com.yyz.mp.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yyz.mp.dao.UserDao;
import com.yyz.mp.pojo.User;
import com.yyz.mp.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {

    @Override
    public List<User> queryAll() {
        List<User> list = list();
        return list;
    }

    @Override
    public User queryById(int id) {
        User user = getById(id);
        return user;
    }

    @Override
    public User queryByUsername(String username) {
        User user = query().eq("username", username).one();
        return user;
    }

    @Override
    public boolean saveUser(User user) {
        boolean result = save(user);
        return result;
    }

    @Override
    public boolean update(User user) {
        boolean result = updateById(user);
        return result;
    }

    @Override
    public boolean deleteById(int id) {
        boolean result = removeById(id);
        return result;
    }
}
