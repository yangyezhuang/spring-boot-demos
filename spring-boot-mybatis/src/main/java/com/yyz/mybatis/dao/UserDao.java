package com.yyz.mybatis.dao;

import com.yyz.mybatis.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 用户接口
 *
 * @author YangYezhuang
 * @date 2023/8/15 18:30
 */
@Mapper
public interface UserDao {

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
    int updateById(User user);

    /**
     * 根据id删除用户(使用注解形式)
     *
     * @param id
     * @return
     */
    @Delete("delete from user where id=#{id}")
    int deleteById(int id);
}
