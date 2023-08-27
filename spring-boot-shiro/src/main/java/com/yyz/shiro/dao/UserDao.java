package com.yyz.shiro.dao;

import com.yyz.shiro.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface UserDao {

    @Select("SELECT * FROM  user WHERE username = #{username}")
    User queryByUsername(String username);

}
