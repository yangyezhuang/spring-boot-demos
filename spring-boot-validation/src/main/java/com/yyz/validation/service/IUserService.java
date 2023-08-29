package com.yyz.validation.service;

import com.yyz.validation.pojo.User;

import java.util.List;

/**
 * IUserService
 *
 * @author YZ.YANG
 * @date 2023/8/27 18:58
 */
public interface IUserService {
    List<User> queryAll();

    int saveUser(User user);

    User updateUser(User user);
}
