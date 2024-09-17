package com.yyz.rabbitmq.produce;

import com.yyz.rabbitmq.produce.config.RabbitMQConfig;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Producer 生产者
 *
 * @author YZ.YANG
 * @date 2023/9/3 14:29
 */
@RestController
public class Producer {

    @Autowired
    RabbitTemplate rabbitTemplate;


    @PostMapping("/send/{key}/{msg}")
    public String produce(@PathVariable("key") String key, @PathVariable("msg") String msg) {
        // key格式：item.* （参考RabbitMQConfig中 key 格式）
        System.out.println("message: " + msg);
        rabbitTemplate.convertAndSend(RabbitMQConfig.ITEM_TOPIC_EXCHANGE, key, msg);
        return "发送成功";
    }
}
