package com.yyz.quartz.config;

import org.quartz.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Quartz配置类
 * 定义任务描述和具体的执行时间
 *
 * @author YZ.YANG
 * @date 2023/9/5 12:11
 */
@Configuration
public class QuartzConfig {

    /**
     * 指定任务描述具体的实现类
     *
     * @return
     */
    @Bean
    public JobDetail jobDetail() {
        return JobBuilder.newJob(MyJob.class)
                // 指定任务的名称
                .withIdentity("MyJob")
                // 任务描述
                .withDescription("任务描述：用于输出")
                // 每次任务执行后进行存储
                .storeDurably()
                .build();
    }


    /**
     * 创建触发器
     *
     * @return
     */
    @Bean
    public Trigger trigger() {
        return TriggerBuilder.newTrigger()
                // 绑定工作任务
                .forJob(jobDetail())
                // 每隔 5 秒执行一次 job
                .withSchedule(SimpleScheduleBuilder.repeatSecondlyForever(5))
                .build();
    }
}
