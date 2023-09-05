package com.yyz.quartz.config;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.time.LocalDateTime;

/**
 * MyJob 定义任务
 *
 * @author YZ.YANG
 * @date 2023/9/5 12:26
 */
public class MyJob extends QuartzJobBean {

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        System.out.println("当前时间：" + LocalDateTime.now());
    }
}
