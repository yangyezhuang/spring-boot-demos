package com.yyz.server.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ServerController
 *
 * @author YZ.YANG
 * @date 2023/9/1 9:51
 */
@RestController
@RequestMapping("/demo")
public class ServerController {

    @GetMapping("/test")
    public String test() {
        return "This is client";
    }
}

