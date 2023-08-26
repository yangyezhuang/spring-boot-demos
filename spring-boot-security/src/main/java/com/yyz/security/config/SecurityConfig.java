package com.yyz.security.config;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


/**
 * Security配置类 (AOP: 拦截器)
 */
@EnableWebSecurity
//@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//    @Bean
//    public AuthenticationManager authenticationManagerBean() throws Exception {
//        return super.authenticationManagerBean();
//    }


//    @Bean
//    public UserDetailsService userDetailsService() {
//        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
//        manager.createUser(User.withUsername("aa").password("123").authorities("p1").build());
//        manager.createUser(User.withUsername("ss").password("456").authorities("p2").build());
//        return manager;
//    }


    /**
     * 重写configure方法，配置安全拦截机制（授权）
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // 首页所有人可以访问，功能页只有对应有权限的人才能访问
        // 请求授权的规则
        http.authorizeHttpRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/level1/**").hasRole("vip1")
                .antMatchers("/level2/**").hasRole("vip2")
                .antMatchers("/level3/**").hasRole("vip3");

        // 没有权限默认会到登录界面,需要开启登录的界面
        http.formLogin().loginPage("/toLogin").usernameParameter("user").passwordParameter("pwd").loginProcessingUrl("/login");
        // 注销，开启注销功能，跳到首页
        http.logout().logoutSuccessUrl("/");
        // 开启记住我功能 cookie，默认保存两周，自定义接收前端的参数
        http.rememberMe().rememberMeParameter("remember");

//        http.csrf().disable().authorizeRequests()
//                .antMatchers("/r/**").authenticated()//访问/r开始的请求需要认证通过
//                .anyRequest().permitAll()//其它请求全部放行
//                .and()
//                .formLogin().successForwardUrl("/login-success");//登录成功跳转到/login-success
    }

//    /**
//     * 配置密码加密器
//     *
//     * @return
//     */
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        // 密码为明文方式
//        return NoOpPasswordEncoder.getInstance();
//        // return new BCryptPasswordEncoder();
//    }


    /**
     * 认证
     * 密码编码：passwordEncoder
     *
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //这些数据正常应该从数据库中读
        auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder())
                .withUser("tom").password(new BCryptPasswordEncoder().encode("123")).roles("vip2", "vip3")
                .and()
                .withUser("root").password(new BCryptPasswordEncoder().encode("123456")).roles("vip1", "vip2", "vip3")
                .and()
                .withUser("guest").password(new BCryptPasswordEncoder().encode("123456")).roles("vip1");
    }

}
