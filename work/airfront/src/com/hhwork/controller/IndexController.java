package com.hhwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController extends BaseController {
	@RequestMapping({"index"})
	public String index(ModelMap model) { 
		return "mainnew"; 
    }
	
	@RequestMapping({"product"})
	public String product(ModelMap model) { 
		return "productlist"; 
    }
	
	@RequestMapping({"solution"})
	public String solution(ModelMap model) { 
		return "solution"; 
    }
	
	@RequestMapping({"download"})
	public String download(ModelMap model) { 
		return "download"; 
    }
	
	@RequestMapping({"online"})
	public String online(ModelMap model) { 
		return "online"; 
    }
	
	@RequestMapping({"about"})
	public String about(ModelMap model) { 
		return "about"; 
    }
	
	@RequestMapping({"contact"})
	public String contact(ModelMap model) { 
		return "contact"; 
    }
}
