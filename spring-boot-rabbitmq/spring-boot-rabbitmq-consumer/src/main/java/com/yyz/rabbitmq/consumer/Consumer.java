package com.yyz.rabbitmq.consumer;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * Consumer 消费者
 *
 * @author YZ.YANG
 * @date 2023/9/3 14:30
 */
@Component
public class Consumer {

    @RabbitListener(queues = "item_queue")
    public void process(String message) {
        System.out.println("消费者运行: " + message);
    }

}
