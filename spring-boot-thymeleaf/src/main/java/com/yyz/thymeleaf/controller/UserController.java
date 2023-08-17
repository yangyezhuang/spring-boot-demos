package com.yyz.thymeleaf.controller;

import com.yyz.thymeleaf.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

/**
 * UserController
 *
 * @author YangYezhuang
 * @date 2023/8/16 13:07
 */
@Controller
public class UserController {

    @GetMapping("/")
    public ModelAndView user() {
        ArrayList<Object> users = getUser();
        ModelAndView mv = new ModelAndView();
        mv.addObject("title", "这是标题");
        mv.addObject("users", users);
        mv.setViewName("index");
        return mv;
    }

    @GetMapping("/test")
    public String test(Model model) {
        model.addAttribute("test", "这是测试数据");
        return "index";
    }

    public ArrayList<Object> getUser() {
        ArrayList<Object> list = new ArrayList<>();
        for (int i = 1; i < 5; i++) {
            User user = new User();
            user.setId(i);
            user.setName("user" + 1);
            user.setAge(20 + i);
            list.add(user);
        }
        return list;
    }
}
