package com.yyz.jdbc.service;

import com.yyz.jdbc.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * 用户接口
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
public interface UserService {
    List<Map<String, Object>> queryAll();

    Map<String, Object> queryById(int id);

    int saveUser(User user);

    Map<String, Object> updateById(User user);

    void deleteById(int id);

}
