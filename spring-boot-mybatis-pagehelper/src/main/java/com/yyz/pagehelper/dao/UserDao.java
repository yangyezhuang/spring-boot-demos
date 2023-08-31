package com.yyz.pagehelper.dao;

import com.yyz.pagehelper.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 用户接口
 *
 * @author YZ.YANG
 * @date 2023/8/30 18:31
 */
@Mapper
public interface UserDao {

    /**
     * 查询全部
     *
     * @return
     */
    @Select("select * from user")
    List<User> queryAll();

    /**
     * 根据性别查询
     *
     * @param sex
     * @return
     */
    @Select("select * from user where sex=#{sex}")
    List<User> queryBySex(String sex);

}
