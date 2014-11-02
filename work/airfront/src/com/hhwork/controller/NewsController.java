package com.hhwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="news/*")
public class NewsController extends BaseController {
	
	@RequestMapping(value="view")
	public String view(ModelMap model) { 
		String id = this.getString("id");	
		return "newsView";
    }
}
