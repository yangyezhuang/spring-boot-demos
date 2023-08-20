package com.yyz.jdbc.service.impl;

import com.yyz.jdbc.pojo.User;
import com.yyz.jdbc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 用户接口实现类
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Transactional
    @Override
    public List<Map<String, Object>> queryAll() {
        String sql = "select * from user";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Transactional
    @Override
    public Map<String, Object> queryById(int id) {
        try {
            String sql = "select * from user where id=?";
            Map<String, Object> map = jdbcTemplate.queryForMap(sql, id);
            return map;
        } catch (EmptyResultDataAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Transactional
    @Override
    public int saveUser(User user) {
        String sql = "insert into user(username,password, sex, age) values(?, ?, ?, ?)";
        return jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getSex(), user.getAge());
    }

    @Transactional
    @Override
    public Map<String, Object> updateById(User user) {
        Object[] params = new Object[]{
                user.getUsername(),
                user.getPassword(),
                user.getSex(),
                user.getAge(),
                user.getId()
        };

        // 修改信息
        String updateSql = "update user set username=?, password = ?, sex=?, age=? WHERE id=?";
        int update = jdbcTemplate.update(updateSql, params);

        if (update == 1) {
            // 查询修改后的信息
            String selectSql = "select * from user where id=?";
            Map<String, Object> map = jdbcTemplate.queryForMap(selectSql, user.getId());
            return map;
        }
        return null;
    }

    @Transactional
    @Override
    public void deleteById(int id) {
        try {
            String sql = "delete from user where id=?";
            jdbcTemplate.update(sql, id);
        } catch (EmptyResultDataAccessException e) {
            e.printStackTrace();
        }
    }

}
