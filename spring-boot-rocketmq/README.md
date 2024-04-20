# spring-boot-rocketmq

## 添加依赖

```xml
<dependency>
    <groupId>org.apache.rocketmq</groupId>
    <artifactId>rocketmq-spring-boot-starter</artifactId>
    <version>2.0.4</version>
</dependency>
```

## 配置环境变量

创建环境变量

```bash
ROCKETMQ_HOME
D:\DevApps\rocketmq-5.2.0
```

在Path里添加

```shell
%ROCKETMQ_HOME%\bin
```

## 启动

```sh
mqnamesrv.cmd
```

### 1.2 启动broker

```shell
mqbroker.cmd -n 127.0.0.1:9876 autoCreateTopicEnable=true
```

### 1.3 创建Topic

```shell
mqadmin updateTopic -n localhost:9876  -b localhost:10911  -t tx-mq-TOPIC
```

### 修改配置

```properties
2、配置项说明
#在发送消息时，自动创建服务器不存在的Topic，默认创建的队列数
defaultTopicQueueNums=4
#是否允许Broker 自动创建Topic，建议线下开启，线上关闭
autoCreateTopicEnable=true
#是否允许Broker自动创建订阅组，建议线下开启，线上关闭
autoCreateSubscriptionGroup=true
#Broker 对外服务的监听端口
listenPort=10911
#删除文件时间点，默认是凌晨4点
deleteWhen=04
#文件保留时间，默认48小时
fileReservedTime=120
#检测物理文件磁盘空间
diskMaxUsedSpaceRatio=88
#存储路径
storePathRootDir=D:/DevApps/rocketmq/logs/store
#commitLog存储路径
storePathCommitLog=D:/DevApps/rocketmq/logs/store/commitlog
#消费队列存储路径
storePathConsumeQueue=D:/DevApps/rocketmq/logs/store/consumequeue
#消息索引存储路径
storePathIndex=D:/DevApps/rocketmq/logs/store/index
#checkpoint 文件存储路径
storeCheckpoint=D:/DevApps/rocketmq/logs/store/checkpoint
#abort 文件存储路径
abortFile=D:/DevApps/rocketmq/logs/store/abort
```

## 指定启动配置文件

```shell
mqbroker.cmd -n 127.0.0.1:9876 -c ../conf/broker.conf
```

### 1.4 关闭RocketMQ

```shell
mqshutdown.cmd
```
