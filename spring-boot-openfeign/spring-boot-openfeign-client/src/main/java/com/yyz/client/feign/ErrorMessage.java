package com.yyz.client.feign;

import org.springframework.stereotype.Component;

/**
 * 熔断降级
 *
 * @author YZ.YANG
 * @date 2023/9/1 10:19
 */
@Component
public class ErrorMessage implements FeignDemo {
    @Override
    public String test() {
        return "服务器开小差了，请稍后再试";
    }
}
