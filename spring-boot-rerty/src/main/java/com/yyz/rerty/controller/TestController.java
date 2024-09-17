package com.yyz.rerty.controller;

import com.yyz.rerty.service.TestService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * TODO
 *
 * @author yangyz
 * @since 2024/9/17 10:14
 */
@RestController("/")
public class TestController {

    @Resource
    private TestService testService;

    @GetMapping("/test")
    public void test() {
        testService.testRetry();
    }
}
