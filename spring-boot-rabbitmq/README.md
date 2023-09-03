# spring-boot-rabbit-mq

> 此 demo 主要演示了 Spring Boot 如何集成 RabbittMQ

## pom.xml

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-amqp</artifactId>
</dependency>
```

## 生产者
RabbitMQ配置类
```java
@Configuration
public class RabbitMQConfig {
    //交换机名称
    public static final String ITEM_TOPIC_EXCHANGE = "item_topic_exchange";
    //队列名称
    public static final String ITEM_QUEUE = "item_queue";


    /**
     * 声明交换机
     */
    @Bean("itemTopicExchange")
    public Exchange topicExchange() {
        return ExchangeBuilder.topicExchange(ITEM_TOPIC_EXCHANGE).durable(true).build();
    }


    /**
     * 声明队列
     */
    @Bean("itemQueue")
    public Queue itemQueue() {
        return QueueBuilder.durable(ITEM_QUEUE).build();
    }


    /**
     * 绑定队列和交换机
     *
     * @param queue
     * @param exchange
     * @return
     */
    @Bean
    public Binding itemQueueExchange(@Qualifier("itemQueue") Queue queue,
                                     @Qualifier("itemTopicExchange") Exchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with("item.#").noargs();
    }
}
```

## Producer.java
生产者发送消息
```java
@RestController
public class Producer {

    @Autowired
    RabbitTemplate rabbitTemplate;

    @PostMapping("/send/{key}/{msg}")
    public String produce(@PathVariable("key") String key, @PathVariable("msg") String msg) {
        System.out.println("message: " + msg);
        rabbitTemplate.convertAndSend(RabbitMQConfig.ITEM_TOPIC_EXCHANGE, key, msg);
        return "发送成功";
    }
}
```

## application.yml
```yaml
spring:
  rabbitmq:
    # RabbitMQ服务的地址
    host: node
    port: 5672
    username: guest
    password: guest
    # RabbitMQ 服务创建的虚拟主机(非必须)
    virtual-host: /
```



## 消费者

## Consumer.java
消费者接收消息
```java
@Component
public class Consumer {

    @RabbitListener(queues = "item_queue")
    public void process(String message) {
        System.out.println("消费者运行: " + message);
    }

}
```

## application.yml
```yaml
server:
  port: 8081
spring:
  rabbitmq:
    # RabbitMQ服务的地址
    host: node
    port: 5672
    username: guest
    password: guest
    # RabbitMQ 服务创建的虚拟主机(非必须)
    virtual-host: /
```


## docker-sh
```shell
docker run -d --restart=always -p 15672:15672 -p 5672:5672 -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest rabbitmq:management
```