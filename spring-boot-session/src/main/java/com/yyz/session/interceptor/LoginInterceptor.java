package com.yyz.session.interceptor;

import com.yyz.session.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Login拦截器
 *
 * @author YZ.YANG
 * @date 2023-10-04 11:00
 */
@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {

    // 在controller之前执行
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HttpSession session = request.getSession();
        User userInfo = (User) session.getAttribute("userId");
        if (userInfo == null) {
            log.info("登录信息不存在");
            // response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        return true;
    }
}
