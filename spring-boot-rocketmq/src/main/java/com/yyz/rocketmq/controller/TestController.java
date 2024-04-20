package com.yyz.rocketmq.controller;

import com.yyz.rocketmq.service.impl.MQProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * TestController
 *
 * @author: yangyz
 * @date: 2024-04-19 17:32
 */
@RestController("/")
public class TestController {

    @Autowired
    private MQProducerService mqProducerService;

    private static final String TOPIC = "USER_TOPIC";

    @GetMapping("/send/{name}")
    public void send(@PathVariable("name") String name) {
        mqProducerService.sendMessage(TOPIC, name);
    }

}
