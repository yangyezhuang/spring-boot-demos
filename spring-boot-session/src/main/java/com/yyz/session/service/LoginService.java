package com.yyz.session.service;

import com.yyz.session.model.User;

/**
 * LoginService
 *
 * @author: YZ.YANG
 * @date: 2023-10-04 10:45
 */
public interface LoginService {
    /**
     * 根据username 查询
     *
     * @param username
     * @return
     */
    User queryByUsername(String username);
}
