package com.LinkT.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

    // 메소드 정의
    // 게시글 목록을 보여주는 메소드
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("Login.do")
    public String Login(){
        return "Login";
    }
}