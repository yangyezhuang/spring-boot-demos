package com.yyz.redis.service.impl;

import com.yyz.redis.dao.UserDao;
import com.yyz.redis.pojo.User;
import com.yyz.redis.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户接口实现类
 *
 * @author YangYezhuang
 * @date 2023/8/21 18:30
 */
@Slf4j
@CacheConfig(cacheNames = "user")
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Cacheable(key = "'users'", value = "users")
    @Override
    public List<User> queryAll() {
        List<User> users = userDao.queryAll();
        log.info("查询数据库【queryAll】：" + users);
        return users;
    }


    /**
     * 结果为空时不缓存
     *
     * @param id
     * @return
     */
    @Cacheable(key = "#id", value = "user", unless = "#result == null")
    @Override
    public User queryById(int id) {
        User user = userDao.queryById(id);
        log.info("查询数据库【queryById】：" + user);
        return user;
    }


    @CachePut(key = "#user.id", value = "user")
    @Transactional
    @Override
    public int saveUser(User user) {
        return userDao.saveUser(user);
    }


    @CachePut(key = "#user.id", value = "user")
    @Transactional
    @Override
    public User updateById(User user) {
        // 修改用户信息
        int i = userDao.updateById(user);
        // 查询修改后的信息
        if (i == 1) {
            User newUser = userDao.queryById(user.getId());
            return newUser;
        }

        return null;
    }


    @CacheEvict(key = "#id")
    @Transactional
    @Override
    public int deleteById(int id) {
        return userDao.deleteById(id);
    }
}
