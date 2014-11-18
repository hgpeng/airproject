package com.hhwork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.service.AppCaseService;

@Controller
@RequestMapping("/case/*")
public class CaseController {
	
	@Autowired
	private AppCaseService appCaseService;
	
	@RequestMapping("list")
	public String menuIndex(){
		return "/case/list";
	}
}
