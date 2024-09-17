package com.yyz.rerty.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.retry.annotation.Recover;
import org.springframework.retry.annotation.Retryable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * TODO
 *
 * @author yangyz@yunrong.cn
 * @version V2.1
 * @since 2024/9/17 10:18
 */
@Service
public class TestService {

    private static final Logger log = LoggerFactory.getLogger(TestService.class);

    @Async
    public void asyncWaiting() throws InterruptedException {
        System.out.println(Thread.currentThread().getName() + "开始执行");
        Thread.sleep(100);
    }

    /**
     * @Retryable(value = Exception.class) 遇到某个异常时触发重试
     */
    @Retryable(retryFor = Exception.class)
    public void testRetry() {
        log.info("进入重试方法内部");
        throw new RuntimeException("发生异常");
    }

    /**
     * @Recover 默认三次重试都失败后，进入到这个方法内，用于处理失败后的记录或者回退等操作
     */
    @Recover
    public void recover() {
        log.info("进入recover方法");
    }
}
