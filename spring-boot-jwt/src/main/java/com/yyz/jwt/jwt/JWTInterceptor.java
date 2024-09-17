package com.yyz.jwt.jwt;

import com.auth0.jwt.exceptions.AlgorithmMismatchException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * token 拦截器
 */
public class JWTInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(JWTInterceptor.class);


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String token = request.getHeader("token");
        log.info("token：" + token);

        if (token == null) {
            log.error("token为空");
        }
        try {
            JwtUtil.verifyToken(token);
        } catch (SignatureVerificationException e) {
            log.error("无效签名");
            return false;
        } catch (TokenExpiredException e) {
            log.error("token过");
            return false;
        } catch (AlgorithmMismatchException e) {
            log.error("token算法不一致");
            return false;
        } catch (Exception e) {
            log.error("token无效");
            return false;
        }
        return true;
    }
}
