package com.yyz.redis.service;

import com.yyz.redis.pojo.User;

import java.util.List;

/**
 * 用户接口
 *
 * @author YangYezhuang
 * @date 2023/8/21 18:30
 */
public interface UserService {

    /**
     * 查询全部用户信息
     *
     * @return
     */
    List<User> queryAll();

    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    User queryById(int id);

    /**
     * 添加用户信息
     *
     * @param user
     * @return
     */
    int saveUser(User user);

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    User updateById(User user);

    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    int deleteById(int id);
}
