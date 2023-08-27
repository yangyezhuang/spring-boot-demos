package com.yyz.jwt.dao;

import com.yyz.jwt.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * UserDao
 */
@Mapper
public interface UserDao {

    @Select("select * from  user where username=#{username};")
    User queryByUsername(String username);

}
