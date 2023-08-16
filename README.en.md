<h1 align="center"><a href="https://github.com/yangyezhuang" target="_blank">Spring Boot Demos</a></h1>
<p align="center">
  <a href="https://xkcoding.com"><img alt="author" src="https://img.shields.io/badge/author-Yang Yezhuang-blue.svg"/></a>
  <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html"><img alt="JDK" src="https://img.shields.io/badge/JDK-1.8.0_162-orange.svg"/></a>
  <a href="https://docs.spring.io/spring-boot/docs/2.7.14.RELEASE/reference/html/"><img alt="Spring Boot" src="https://img.shields.io/badge/Spring Boot-2.7.14-brightgreen.svg"/></a>
  <a href="https://github.com/xkcoding/spring-boot-demo/blob/master/LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/xkcoding/spring-boot-demo.svg"/></a>
</p>



<p align="center">
  <span>English | <a href="./README.md">中文</a></span>
</p>

## Project Introduction
`Spring boot demos` is a project used for deep learning and practical use of `spring boot`
>If you still have demos that you want to integrate, you can also click on [issue](https://github.com/xkcoding/spring-boot-demo/issues/new) Liti demand. I will add it additionally to the [TODO](./TODO.md) list. ✊

## Development environment
- **JDK 1.8+**
- **Maven 3.8+**
- **IntelliJ IDEA 2023.2+** (* Note: Be sure to use IDEA development and ensure the installation of the 'lombok' plugin*)
- **MySQL 5.7+** (*Try to ensure that you use version 5.7 or above as it adds some new features and is not backward compatible. This demo will try to avoid such incompatibilities, but it is still recommended to try to ensure version 5.7 or above*)

## Operation mode
1. ` git clone https://github.com/yangyezhuang/spring-boot-demos.git `
2. Using IDEA to open a clone project
3. Import the 'pom. xml' file from the root directory of the Maven Projects panel in IDEA
4. For children's shoes that Maven Projects cannot find, you can click on View ->Tool Buttons on the top toolbar of IDEA, and the Maven Projects panel will appear on the right side of IDEA
5. Find the Application classes of each Module and run each demo
6. `Note: Each demo has a detailed README kit, please remember to take a look before using the demo`
7. `Note: Before running various demos, some require pre initialization of database data`

## Introduction to each module
| Module Name                                        | Module Introduction                                                                |
|----------------------------------------------------|------------------------------------------------------------------------------------|
| [spring-boot-helloworld](./spring-boot-helloworld) | A helloworld of springboot                                                         |
| [spring-boot-mybatis](./spring-boot-mybatis)       | spring-boot integrated mybatis                                                     |
| [spring-boot-properties](./spring-boot-properties)      | spring-boot read properties                                                      |
| [spring-boot-jpa](./spring-boot-jpa)               | spring-boot integrated jpa                                                         |
| [spring-boot-swagger](./spring-boot-swagger)       | spring-boot integrated swagger for unified management and testing of API interfaces |



## Other

### License
[MIT](http://opensource.org/licenses/MIT)