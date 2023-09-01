package com.yyz.client.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * FeignDemo
 *
 * @author YZ.YANG
 * @date 2023/9/1 9:49
 */
@FeignClient(name = "demo", url = "http://localhost:8081/demo", fallback = ErrorMessage.class)
public interface FeignDemo {

    @GetMapping("/test")
    String test();

}
