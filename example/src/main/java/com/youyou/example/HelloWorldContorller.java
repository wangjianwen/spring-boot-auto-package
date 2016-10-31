package com.youyou.example;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloWorldContorller {

    @RequestMapping("/hello")
    @ResponseBody
    public String helloWorld(){
        return "hello world";
    }
}
