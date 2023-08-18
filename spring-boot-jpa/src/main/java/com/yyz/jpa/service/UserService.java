package com.yyz.jpa.service;

import com.yyz.jpa.pojo.User;

import java.util.List;

/**
 * 用户接口
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
public interface UserService {
    List<User> queryAll();

    User queryById(int id);

    User getByUsername(String username);

    User saveUser(User user);

    User updateById(User user);

    void deleteById(int id);

}
