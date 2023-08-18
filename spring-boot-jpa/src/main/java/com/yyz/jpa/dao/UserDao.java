package com.yyz.jpa.dao;

import com.yyz.jpa.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


/**
 * 用户接口
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
@Repository
public interface UserDao extends JpaRepository<User, Integer> {

    /**
     * 自定义查询方式
     *
     * @param username
     * @return
     */
    @Query("select u from User u where u.username = ?1")
    User getByUsername(String username);

}
