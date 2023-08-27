package com.yyz.jwt.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yyz.jwt.pojo.User;
import com.yyz.jwt.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.Calendar;

/**
 * token工具类
 */
@Slf4j
@Service
public class JwtUtil {

    /**
     * 生成token
     *
     * @param user
     * @return
     */
    public static String createToken(User user) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 7); //默认令牌过期时间7天

        JWTCreator.Builder builder = JWT.create();

        builder.withClaim("uid", user.getId())
                .withClaim("username", user.getUsername())
                .withClaim("sex", user.getSex())
                .withClaim("age", user.getAge())
                .withClaim("role", "user");

        return builder.withExpiresAt(calendar.getTime())
                .sign(Algorithm.HMAC256(user.getPassword()));
    }


    /**
     * 解析token
     *
     * @param token
     * @return
     */
    public static DecodedJWT verifyToken(String token) {
        if (token == null) {
            log.info("token不能为空");
        }

        //获取数据库中用户真正的密码
        String password = "123";
        JWTVerifier build = JWT.require(Algorithm.HMAC256(password)).build();
        return build.verify(token);
    }
}
