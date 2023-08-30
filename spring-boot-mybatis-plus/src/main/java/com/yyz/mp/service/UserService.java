package com.yyz.mp.service;

import com.yyz.mp.pojo.User;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

/**
 * 用户接口
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
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
     * 根据username 查询
     *
     * @param username
     * @return
     */
    User queryByUsername(String username);

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
    int updateById(User user);

    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    int deleteById(int id);
}
