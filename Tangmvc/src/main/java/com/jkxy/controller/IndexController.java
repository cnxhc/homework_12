package com.jkxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping(value="index")
	public String helloWorld(){
		return "index";
	}
	@RequestMapping(value="main")
	public String main(){
		return "main";
	}
}
