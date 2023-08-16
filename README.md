<h1 align="center"><a href="https://github.com/yangyezhuang" target="_blank">Spring Boot Demos</a></h1>
<p align="center">
  <a href="https://xkcoding.com"><img alt="author" src="https://img.shields.io/badge/author-Yang Yezhuang-blue.svg"/></a>
  <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html"><img alt="JDK" src="https://img.shields.io/badge/JDK-1.8.0_162-orange.svg"/></a>
  <a href="https://docs.spring.io/spring-boot/docs/2.7.14.RELEASE/reference/html/"><img alt="Spring Boot" src="https://img.shields.io/badge/Spring Boot-2.7.14-brightgreen.svg"/></a>
  <a href="https://github.com/xkcoding/spring-boot-demo/blob/master/LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/xkcoding/spring-boot-demo.svg"/></a>
</p>

<p align="center">
  <span>中文 | <a href="./README.en.md">English</a></span>
</p>

## 项目简介

`spring boot demo` 是一个用来深度学习并实战 `spring boot` 的项目

> 如果大家还有想要集成的demo，也可在 [issue](https://github.com/xkcoding/spring-boot-demo/issues/new) 里提需求。我会额外添加在 [TODO](./TODO.md) 列表里。✊


## 开发环境

- **JDK 1.8 +**
- **Maven 3.8 +**
- **IntelliJ IDEA 2023.2 +** (*注意：务必使用 IDEA 开发，同时保证安装 `lombok` 插件*)
- **MySQL 5.7 +** (*尽量保证使用 5.7 版本以上，因为 5.7 版本加了一些新特性，同时不向下兼容。本 demo 里会尽量避免这种不兼容的地方，但还是建议尽量保证 5.7 版本以上*)

## 运行方式


1. `git clone https://github.com/yangyezhuang/spring-boot-demos.git`
2. 使用 IDEA 打开 clone 下来的项目
3. 在 IDEA 中 Maven Projects 的面板导入项目根目录下 的 `pom.xml` 文件
4. Maven Projects 找不到的童鞋，可以勾上 IDEA 顶部工具栏的 View -> Tool Buttons ，然后 Maven Projects 的面板就会出现在 IDEA 的右侧
5. 找到各个 Module 的 Application 类就可以运行各个 demo 了
6. **`注意：每个 demo 均有详细的 README 配套，使用 demo 前记得先看看`**
7. **`注意：运行各个 demo 之前，有些是需要事先初始化数据库数据的`**


## 各 Module 介绍

| Module 名称                                         | Module 介绍                               |
|---------------------------------------------------|-----------------------------------------|
| [spring-boot-helloworld](./spring-boot-helloworld) | spring-boot 的一个 helloworld              |
| [spring-boot-mybatis](./spring-boot-mybatis)      | spring-boot 集成 mybatis                  |
| [spring-boot-properties](./spring-boot-properties)      | spring-boot 读取 properties 配置            |
| [spring-boot-jpa](./spring-boot-jpa)              | spring-boot 集成 jpa                      |
| [spring-boot-swagger](./spring-boot-swagger)      | spring-boot 集成 swagger 用于统一管理、测试 API 接口 |

## 其他


### License

[MIT](http://opensource.org/licenses/MIT)
