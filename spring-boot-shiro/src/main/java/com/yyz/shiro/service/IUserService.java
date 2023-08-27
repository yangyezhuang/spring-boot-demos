package com.yyz.shiro.service;

import com.yyz.shiro.pojo.User;


public interface IUserService {

    User queryByUsername(String username);

}
