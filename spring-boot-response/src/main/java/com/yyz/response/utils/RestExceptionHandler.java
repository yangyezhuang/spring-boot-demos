package com.yyz.response.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.security.auth.message.AuthException;

/**
 * 全局异常处理器
 * <p>
 * controller中接口发生Exception异常时，就会进入到Execption方法中进行捕获，
 * 将杂乱的异常信息，转换成指定格式后交给ResponseAdvice方法进行统一格式封装并返回给前端。
 *
 * @author YZ.YANG
 * @date 2023/8/31 11:03
 */
@Slf4j
@RestControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(AuthException.class)
//    public String ErrorHandler(AuthorizationException e) {
    public String ErrorHandler(Exception e) {
        log.error("未通过权限验证！", e);
        return "未通过权限验证！";
    }

    @ExceptionHandler(Exception.class)
    public Result Execption(Exception e) {
        log.error("未知异常！", e);
        return Result.fail(ResultCode.SERVER_BUSY, ResultCode.SERVER_BUSY.getMsg());
    }
}



