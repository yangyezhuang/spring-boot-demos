package com.yyz.easyexcel.dao;

import com.yyz.easyexcel.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * DAO
 *
 * @author YangYezhuang
 * @date 2023/8/21 15:55
 */
@Mapper
public interface UserDao {

    List<UserEntity> findAll();

    // 如果是mybatis,尽量别直接调用多次insert,自己写一个mapper里面新增一个方法batchInsert,所有数据一次性插入
    int save(UserEntity data);

}