package com.hhwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hhwork.common.Constants.SortClass;

@Controller
@RequestMapping("/sort/*")
public class SortController extends BaseController {

	@RequestMapping("inputSort")
	public String inputSort(ModelMap modelMap){
		int id=getInt("id");
		String name=getString("name");
		if(SortClass.ARTICLE.equals(name)){
			
		}else if(SortClass.PRODUCT.equals(name)){
			
		}
		modelMap.put("id", id);
		modelMap.put("name", name);
		return "/sort/inputSort";
	}
}
