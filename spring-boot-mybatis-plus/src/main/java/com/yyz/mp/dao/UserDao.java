package com.yyz.mp.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yyz.mp.pojo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户接口
 *
 * @author YZ.YANG
 * @date 2023/8/15 18:30
 */
@Mapper
public interface UserDao extends BaseMapper<User> {
}
