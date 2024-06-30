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
}
