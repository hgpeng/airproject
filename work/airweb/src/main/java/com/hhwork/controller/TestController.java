package com.hhwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"test/*"})
public class TestController extends BaseController{
	@RequestMapping({"demo1"})
	public String show(ModelMap model) { 
    return "test/demo1"; 
    }
	
	public static void main(String[] args) {
		com.hhwork.model.Test.ts();
	}
}
