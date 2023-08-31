package com.yyz.response.dao;

import com.yyz.response.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 用户接口
 *
 * @author YZ.YANG
 * @date 2023/8/31 11:30
 */
@Mapper
public interface UserDao {

    /**
     * 查询全部用户信息
     *
     * @return
     */
    @Select("select * from user")
    List<User> queryAll();

}
