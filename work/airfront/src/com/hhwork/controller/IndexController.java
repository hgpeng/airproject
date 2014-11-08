package com.hhwork.controller;

import java.util.HashMap;
import java.util.Map;

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
		return "product"; 
    }
	
	@RequestMapping({"productcenter"})
	public String productcenter(ModelMap model) { 
		Map<String,Object> param = new HashMap<String,Object>();
		//查产品系列
		param.put("typeid", "5");
		return "productcenter"; 
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
	
	@RequestMapping({"greenService"})
	public String greenService(ModelMap model) { 
		return "greenService"; 
    }
	
	@RequestMapping(value="caselist")
	public String caselist(ModelMap model) { 
		
		return "caselistnew";
    }
	
	@RequestMapping(value="caseshow")
	public String caseshow(ModelMap model) { 
		
		return "caseshow";
    }
}
