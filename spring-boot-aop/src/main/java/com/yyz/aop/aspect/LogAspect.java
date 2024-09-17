package com.yyz.aop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 自定义切面
 */
@Aspect
@Component
public class LogAspect {

    private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

    /**
     * 使用 表达式方式 定义切面
     * 在执行UserService的每个方法前执行:
     */
    @Before("execution(public * com.yyz.aop.service.impl.UserServiceImpl.*(..))")
    public void startLog() {
        log.info("[Before] 使用表达式方式定义切面");
    }


    /**
     * 使用 注解方式 定义切面
     * 在执行MailService的每个方法前后执行:
     */
    @Around(value = "@annotation(com.yyz.aop.aspect.ToSendLog)")
    public Object doLogging(ProceedingJoinPoint pjp) throws Throwable {
        log.info("[Before] 使用注解方式定义切面");
        log.info("[Around] start " + pjp.getSignature());

        Object retVal = pjp.proceed();

        log.info("result：" + retVal); // 打印方法执行返回值
        log.info("[Around] done " + pjp.getSignature());
        return retVal;
    }

}
