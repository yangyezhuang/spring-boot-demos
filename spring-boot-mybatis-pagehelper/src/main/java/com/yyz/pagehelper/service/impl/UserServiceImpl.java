package com.yyz.pagehelper.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyz.pagehelper.dao.UserDao;
import com.yyz.pagehelper.pojo.User;
import com.yyz.pagehelper.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YZ.YANG
 * @date 2023/8/30 18:34
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public List<User> queryAll(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return userDao.queryAll();
    }

    @Override
    public PageInfo<User> queryBySex(String sex, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> users = userDao.queryBySex(sex);
        PageInfo<User> page = new PageInfo<>(users, pageSize);
        return page;
    }

}
