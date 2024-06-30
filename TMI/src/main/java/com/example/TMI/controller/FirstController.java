package com.example.TMI.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FirstController {
    @GetMapping("/aboutUs")
    public String aboutUs(){
        return "aboutUs";
    }

    @GetMapping("/cancel")
    public String cancel(){
        return "cancel";
    }

    @GetMapping("/community")
    public String community(){
        return "community";
    }

    @GetMapping("/findPwd")
    public String findPwd(){
        return "findPwd";
    }

    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/info")
    public String info(){
        return "info";
    }

    @GetMapping("/inquiry")
    public String inquiry(){
        return "inquiry";
    }

    @GetMapping("/join1")
    public String join1(){
        return "join1";
    }

    @GetMapping("/join2")
    public String join2(){
        return "join2";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/post")
    public String post(){
        return "post";
    }

    @GetMapping("/setEmail")
    public String setEmail(){
        return "setEmail";
    }

    @GetMapping("/setPwd")
    public String setPwd(){
        return "setPwd";
    }

    @GetMapping("/writing")
    public String writing(){
        return "writing";
    }
}
