package com.yyz.poi.dao;

import com.yyz.poi.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * UserDao
 *
 * @author YangYezhuang
 * @date 2023/8/22 14:04
 */
@Mapper
public interface UserDao {
    List<User> getAll();

    int save(User user);
}
