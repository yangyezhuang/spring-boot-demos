package com.yyz.pagehelper.controller;

import com.github.pagehelper.PageInfo;
import com.yyz.pagehelper.pojo.User;
import com.yyz.pagehelper.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户控制层
 *
 * @author YZ.YANG
 * @date 2023/8/30 18:33
 */
@RestController
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询全部用户
     *
     * @return
     */
    @GetMapping("/list/{pageNum}/{pageSize}")
    public List<User> getUserList(@PathVariable("pageNum") int pageNum,
                                  @PathVariable("pageSize") int pageSize) {
        return userService.queryAll(pageNum, pageSize);
    }


    /**
     * 根据性别查询
     *
     * @param sex
     * @return
     */
    @GetMapping("/list/{sex}/{pageNum}/{pageSize}")
    public PageInfo<User> queryBySex(@PathVariable("sex") String sex,
                                     @PathVariable("pageNum") int pageNum,
                                     @PathVariable("pageSize") int pageSize) {
        return userService.queryBySex(sex, pageNum, pageSize);
    }

}
