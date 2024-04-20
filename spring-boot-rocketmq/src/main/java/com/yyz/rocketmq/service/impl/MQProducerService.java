package com.yyz.rocketmq.service.impl;

import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * RocketMQProducerImpl
 *
 * @author: yangyz
 * @date: 2024-04-19 17:34
 */
@Service
public class MQProducerService {

    @Autowired
    private RocketMQTemplate rocketMQTemplate;

    private static final String TAG1 = ":tag1";

    public void sendMessage(String topic, String message) {
        rocketMQTemplate.syncSend(topic + TAG1, message);
    }

}
