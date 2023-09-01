package com.yyz.client.controller;

import com.yyz.client.feign.FeignDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ClientController
 *
 * @author YZ.YANG
 * @date 2023/9/1 9:43
 */
@RestController
@RequestMapping("feign")
public class ClientController {
    @Autowired
    FeignDemo feignDemo;

    @GetMapping("test")
    public String test() {
        return feignDemo.test();
    }
}
