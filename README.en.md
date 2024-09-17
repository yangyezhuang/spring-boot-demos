<h1 align="center"><a href="https://github.com/yangyezhuang" target="_blank">Spring Boot Demos</a></h1>
<p align="center">
  <a href="https://xkcoding.com"><img alt="author" src="https://img.shields.io/badge/author-YZ.Yang-blue.svg"/></a>
  <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html"><img alt="JDK" src="https://img.shields.io/badge/JDK-1.8.0_162-orange.svg"/></a>
  <a href="https://docs.spring.io/spring-boot/docs/2.7.14.RELEASE/reference/html/"><img alt="Spring Boot" src="https://img.shields.io/badge/Spring Boot-2.7.14-brightgreen.svg"/></a>
  <a href="https://github.com/xkcoding/spring-boot-demo/blob/master/LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/xkcoding/spring-boot-demo.svg"/></a>
</p>


<p align="center">
  <span>English | <a href="./README.md">中文</a></span>
</p>

## Project Introduction

`Spring boot demos` is a project used for deep learning and practical use of `spring boot`
> If you still have demos that you want to integrate, you can also click
> on [issue](https://github.com/yangyezhuang/spring-boot-demos/issues/new) Liti demand. ✊

## Development environment

- **JDK 1.8+**
- **Maven 3.8+**
- **IntelliJ IDEA 2023.2+** (* Note: Be sure to use IDEA development and ensure the installation of the 'lombok'
  plugin*)
- **MySQL 5.7+** (*It is recommended to use version 5.7 or higher as much as possible.*)

## Operation mode

1. ` git clone https://github.com/yangyezhuang/spring-boot-demos.git `
2. Open the clone project using IDEA and import Maven dependencies
3. Initialize database data
4. Find the Application classes of each Module and run each demo

## Introduction to each module

|   | Module Name                                                        | Module Introduction         |
|---|--------------------------------------------------------------------|-----------------------------|
| √ | [spring-boot-aop](./spring-boot-aop)                               | 演示 aop 打印日志                 |
| √ | [spring-boot-easyexcel](./spring-boot-easyexcel)                   | 集成 easyexcel 用于表格导出导入       |
| √ | [spring-boot-elasticsearch](./spring-boot-elasticsearch)           | 集成 elasticsearch 用于全文搜索     |
| √ | [spring-boot-helloworld](./spring-boot-helloworld)                 | 演示 helloworld               |
| √ | [spring-boot-jdbc](./spring-boot-jdbc)                             | 集成 jdbc 用于操作数据库             |
| √ | [spring-boot-jpa](./spring-boot-jpa)                               | 集成 jpa 用于操作数据库              |
| √ | [spring-boot-jwt](./spring-boot-jwt)                               | 集成 jwt 用于token签发验证          |
|   | [spring-boot-kryo](./spring-boot-kryo)                             | 集成 kryo 用于序列化               |
| √ | [spring-boot-logback](./spring-boot-logback)                       | 集成 logback 用于整合日志           |
| √ | [spring-boot-mail](./spring-boot-mail)                             | 集成 mail 用于发送电子邮件            |
| √ | [spring-boot-minio](./spring-boot-minio)                           | 集成 minio 用于对象存储             |
| √ | [spring-boot-mybatis](./spring-boot-mybatis)                       | 集成 mybatis 用于操作数据库          |
| √ | [spring-boot-mybatis-plus](./spring-boot-mybatis-plus)             | 集成 mybatis-plus 用于操作数据库     |
| √ | [spring-boot-mybatis-pagehelper](./spring-boot-mybatis-pagehelper) | 集成 pagehelper 用于数据库分页       |
| √ | [spring-boot-netty](./spring-boot-netty)                           | 集成 netty NIO通信              |
| √ | [spring-boot-openfeign](./spring-boot-openfeign)                   | 集成 openfeign 实现接口调用         |
| √ | [spring-boot-poi](./spring-boot-poi)                               | 集成 poi 用于表格导出导入             |
| √ | [spring-boot-properties](./spring-boot-properties)                 | 读取 properties 配置            |
| √ | [spring-boot-quartz](./spring-boot-quartz)                         | 集成 Quartz 用于实现任务调度          |
| √ | [spring-boot-rabbitmq](./spring-boot-rabbitmq)                     | 集成 RabbitMQ 用于实现消息队列        |
| √ | [spring-boot-redis](./spring-boot-redis)                           | 集成 redis 用于缓存               |
| √ | [spring-boot-response](./spring-boot-response)                     | 演示统一封装数据返回格式                |
| √ | [spring-boot-security](./spring-boot-security)                     | 集成 security 用于认证和授权         |
|   | [spring-boot-shiro (TODO)](./spring-boot-shiro)                    | 集成 shiro 用于认证和授权            |
| √ | [spring-boot-swagger](./spring-boot-swagger)                       | 集成 swagger 用于统一管理、测试 API 接口 |
| √ | [spring-boot-thymeleaf](./spring-boot-thymeleaf)                   | 集成 thymeleaf 用于前端模板渲染       |
| √ | [spring-boot-validation](./spring-boot-validation)                 | 集成 validation 用于实现参数校验      |
| √ | [spring-boot-xxljob](./spring-boot-xxljob)                         | 集成 xxl-job 用于任务调度           |

## Other

### License

[MIT](http://opensource.org/licenses/MIT)