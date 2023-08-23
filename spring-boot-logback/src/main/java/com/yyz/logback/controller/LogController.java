package com.yyz.logback.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * controller
 *
 * @author YangYezhuang
 * @date 2023/8/23 16:07
 */
@RestController
public class LogController {
    private static final Logger logger = LoggerFactory.getLogger(LogController.class);

    @GetMapping("/test")
    public void test() {
        String name = "tom";
        // 日志级别从低到高: TRACE < DEBUG < INFO < WARN < ERROR < FATAL
        logger.trace("================ trace =================");
        logger.debug("================ debug =================");
        logger.info("================ info =================");
        logger.warn("================ warn =================");
        logger.error("================ error =================");

        logger.info("测试用户：{}", name);
    }

}
