package com.example.TMI.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FirstController {
    @GetMapping("/index")
    public String index(){
        return"header";
    }

    @GetMapping("/aboutUs")
    public String show(){
        return "aboutUs";
    }
}
