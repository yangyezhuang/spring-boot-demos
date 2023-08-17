package com.yyz.swagger.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * User控制层
 */
@Api(value = "用户接口管理", tags = "用户接口管理")
@RestController
@RequestMapping("/user")
public class UserController {

    @ApiOperation("获取用户信息")
    @GetMapping("/{id}")
    public String getUser(@PathVariable("id") int id) {
        return "获取用户" + id + "成功";
    }

    @ApiOperation("新增用户信息")
    @PostMapping()
    public String saveUser() {
        return "新增成功";
    }

    @ApiOperation("修改用户信息")
    @PutMapping("/{id}")
    public String updateUser(@PathVariable("id") int id) {
        return "修改" + id + "成功";
    }

    @ApiOperation("删除用户信息")
    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        return "删除" + id + "成功";
    }

}
