package com.yyz.validation.dao;

import com.yyz.validation.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.hibernate.validator.constraints.ru.INN;

import java.util.List;

/**
 * UserDao
 *
 * @author YZ.YANG
 * @date 2023/8/27 19:04
 */
@Mapper
public interface UserDao {

    @Select("select * from user;")
    List<User> queryAll();

    @Insert("insert into user(username, password, sex, age) VALUES (#{username},#{password},#{sex},#{age})")
    int saveUser(User user);

    @Update("update user set password=#{password};")
    User updateUser(User user);
}
