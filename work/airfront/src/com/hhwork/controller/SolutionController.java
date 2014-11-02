package com.hhwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="solution/*")
public class SolutionController extends BaseController {
	@RequestMapping(value="list")
	public String view(ModelMap model) { 
		String id = this.getString("id");
		
		return "solutionList";
    }
	
	@RequestMapping(value="caselist")
	public String caselist(ModelMap model) { 
		
		
		return "caseList";
    }
}