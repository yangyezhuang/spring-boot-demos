package com.yyz.pagehelper.service;

import com.github.pagehelper.PageInfo;
import com.yyz.pagehelper.pojo.User;

import java.util.List;

/**
 * 用户接口
 *
 * @author YZ.YANG
 * @date 2023/8/30 18:35
 */
public interface UserService {

    /**
     * 查询全部
     *
     * @return
     */
    List<User> queryAll(int pageNum, int pageSize);

    /**
     * 根据性别查询
     *
     * @param sex
     * @return
     */
    PageInfo<User> queryBySex(String sex, int pageNum, int pageSize);

}
